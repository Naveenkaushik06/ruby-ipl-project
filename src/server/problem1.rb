# Number of matches played per year for all the years in IPL.
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)

def matchesPerYear(matches)
  result = {}

  for match in matches
    if result[match['season']]
      result[match['season']] += 1
    else
      result[match['season']] = 1
    end
  end
  result
end
output = {}
output = matchesPerYear(matches)
puts(output)
File.open('../public/output/problem-1.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }

graph = Gruff::Bar.new
graph.x_axis_label = 'season_wise'
graph.y_axis_label = 'number_of_matches'
graph.y_axis_increment = 20
graph.show_labels_for_bar_values = true
graph.theme = { marker_color: 'black', background_colors: %w[white gray] }
graph.title = 'Matches Played Per Year'

output.each do |season, matches_count|
  graph.data(season, matches_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

graph.write('../plots/1_number_of_matches_per_year.png')
