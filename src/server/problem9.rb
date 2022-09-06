# Find the bowler with the best economy in super overs
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries=CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'),headers:true)
def economicalBowlers(matches, deliveries)
    bowlers = {}
    for  matchdata in matches 
       id = matchdata['id']
        
                for  deliverdata in deliveries 
                    if (deliverdata['is_super_over']==='1') 
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
    #  puts bowlers
   
   topten = []
  for eachBowler in bowlers
        eco = eachBowler[1]['totalRuns'] / ( eachBowler[1]['totalBalls'] / 6.0 )
        eachBowler[1]['economy'] = eco
        topten.push(eachBowler[1]['economy'])  
  end

  topten = topten.sort
  myobject = {}
  for j in 0..3 
        for  bowler in bowlers
             if (bowler[1]['economy'] == topten[j])
                myobject[bowler[0]] = topten[j]
             end
        end
  end
   myobject

end
output = economicalBowlers(matches, deliveries)
File.open('/home/naveen/Desktop/ruby-ipl-project/src/public/output/problem-9.json','wb'){ |file| file.puts JSON.pretty_generate(output) }


plot = Gruff::Bar.new
plot.x_axis_label = 'Names of Bowlers'
plot.y_axis_label = 'Best Economy'
plot.y_axis_increment = 2
plot.show_labels_for_bar_values = true
plot.theme = { marker_color: 'black', background_colors: %w[white purple] }
plot.title = 'Top 5 Economy Bowlers in Super Overs'

output.each do |bowler, economy_count|
  
  plot.data(bowler, economy_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

plot.write('/home/naveen/Desktop/ruby-ipl-project/src/plots/9_best_bowler_in_super_over.png')