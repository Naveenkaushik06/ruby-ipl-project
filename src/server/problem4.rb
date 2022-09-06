require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries=CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'),headers:true)

def economicalBowlers(matches, deliveries)
    bowlers = {}
    for  matchdata in matches do
       id = matchdata['id']
            if(matchdata['season'] === '2015') 
                for  deliverdata in deliveries do
                    if (deliverdata['match_id'] === id) 
                        # print "#{deliverdata['bowler']}, #{deliverdata['total_runs']} \n"

                        unless bowlers[deliverdata['bowler']]
                            bowlers[deliverdata['bowler']] = {
                                'totalRuns' => 0,
                                'totalBalls' => 0,
                                'economy' => 0
                            }
                        end


                            bowlers[deliverdata['bowler']]['totalBalls'] += 1
                            bowlers[deliverdata['bowler']]['totalRuns'] = bowlers[deliverdata['bowler']]['totalRuns'].to_i + deliverdata['total_runs'].to_i

                        
                    end
                end
            end      
     end
    #  puts bowlers
   
   topten = []
  for eachBowler in bowlers
        eco = eachBowler[1]['totalRuns'] / ( eachBowler[1]['totalBalls'] / 6.0 )
        eachBowler[1]['economy'] = eco
        topten.push(eachBowler[1]['economy'])  
  end

  topten = topten.sort
  myobject = {}
  for j in 0..9 
        for  bowler in bowlers
             if (bowler[1]['economy'] == topten[j])
                myobject[bowler[0]] = topten[j]
             end
       end
  end
  return myobject

end
output = economicalBowlers(matches, deliveries)
File.open('/home/naveen/Desktop/ruby-ipl-project/src/public/output/problem-4.json','wb'){ |file| file.puts JSON.pretty_generate(output) }


plot = Gruff::Bar.new
plot.x_axis_label = 'Names of Bowlers'
plot.y_axis_label = 'Top Economy'
plot.y_axis_increment = 3
plot.show_labels_for_bar_values = true
plot.theme = { marker_color: 'black', background_colors: %w[white purple] }
plot.title = 'Top 10 Economy Bowlers'

output.each do |season, matches_count|
  
  plot.data(season, matches_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

plot.write('/home/naveen/Desktop/ruby-ipl-project/src/plots/4_top 10_economy.png')





















# def plot(data, output)
#   graph = Gruff::Bar.new
#   graph.theme = { marker_color: 'black', background_colors: %w[white grey] }
#   graph.title = 'Top 10 Economical Bowlers in 2015'
#   graph.x_axis_label = 'Bowlers'
#   graph.y_axis_label = 'Economic Rate'
#   graph.show_labels_for_bar_values = true
#   data.each do |team, runs|
#     graph.data(team, runs, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
#   end
#   graph.write(output)
