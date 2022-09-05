require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)

# Find a player who has won the highest number of Player of the Match awards for each season

def winsPerTeam(matches)
     obj=Hash.new;
          for year in matches
          if(obj[year['season']]) 
              if(obj[year['season']][year['player_of_match']])
              obj[year['season']][year['player_of_match']]+=1;
              else
              obj[year['season']][year['player_of_match']]=1;
              end
         else
         obj[year['season']]={};
         obj[year['season']][year['player_of_match']]=1;
         end  
         end
         return obj
         File.open('../output/6_highest_player_of_match.json', 'wb') { |file| file.puts JSON.pretty_generate(obj) }

end

output = {}
output = winsPerTeam(matches)
puts output

store={}
for year in output do
     store [year[0]] =  year[1].sort_by(&:last)[-1]
end
puts store
File.open("../public/output/problem-6.json", "wb") { |file| file.puts JSON.pretty_generate(store) }

graph = Gruff::Bar.new
graph.x_axis_label = 'year'
graph.y_axis_label = 'highest_number_of_player_of_match'
graph.y_axis_increment = 5
graph.show_labels_for_bar_values = true
graph.theme = { marker_color: 'black', background_colors: %w[white gray] }
graph.title = 'Highest Number Of Player Of Match'

output.each do |team, win_count|
  graph.data(team, win_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

graph.write('../plots/6_highest_number_of_player_of_match.png')
