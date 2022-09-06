# Extra runs conceded per team in the year 2016
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'), headers: true)


def extraRunsByTeam(matches, deliveries)
  extrarun = {}
  for matchdata in matches
    id = matchdata['id']

    next unless matchdata['season'] === '2016'

    for  deliverdata in deliveries

      if deliverdata['match_id'] === id

        if extrarun[deliverdata['bowling_team']]
          extrarun[deliverdata['bowling_team']] += deliverdata['extra_runs'].to_i
        else
          extrarun[deliverdata['bowling_team']] = deliverdata['extra_runs'].to_i
        end
      end
    end
 end
  extrarun
end

output = {}
output = extraRunsByTeam(matches, deliveries)
puts output
File.open('../public/output/problem-3.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }

graph = Gruff::Bar.new
graph.x_axis_label = 'team'
graph.y_axis_label = 'extra_run_conceeded'
graph.y_axis_increment = 30
graph.show_labels_for_bar_values = true
graph.theme = { marker_color: 'black', background_colors: %w[white gray] }
graph.title = 'Extra Run Conceeded Per Team'

output.each do |team, extra_run_count|
  graph.data(team, extra_run_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

graph.write('../plots/3_extra_run_count_per_team.png')
