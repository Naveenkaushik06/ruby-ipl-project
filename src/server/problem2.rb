# Number of matches won per team per year in IPL.
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)

def winsPerTeam(matches)
  obj = {}
  for year in matches
    if obj[year['season']]
      if obj[year['season']][year['winner']]
        obj[year['season']][year['winner']] += 1
      else
        obj[year['season']][year['winner']] = 1
      end
    else
      obj[year['season']] = {}
      obj[year['season']][year['winner']] = 1
    end
 end
  obj
end

output = {}
output = winsPerTeam(matches)
puts(output)
File.open('../public/output/problem-2.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }

# graph = Gruff::Bar.new
# graph.x_axis_label = 'season'
# graph.y_axis_label = 'number_of_matches_win_per_year'
# graph.y_axis_increment = 5
# graph.show_labels_for_bar_values = true
# graph.theme = {marker_color: 'black', background_colors: %w[white gray]}
# graph.title = 'Team Won Matches Per Year'

# output.each do |season, matches_win_count|
#   graph.data(season, matches_win_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
# end

# graph.write('../plots/2_win_per_team_per_year.png')