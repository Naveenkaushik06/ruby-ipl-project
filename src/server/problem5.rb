# Find the number of times each team won the toss and also won the match
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)


def winTossWinMatch(matches)
  result = {}
  for m in matches
    if m['toss_winner'] === m['winner']
      if result.has_key?(m['winner'])
        result[m['winner']] += 1
      else
        result[m['winner']] = 1
      end
    end
   end
  return result
  File.open('../output/5_win_toss_and_win_match.json', 'wb') { |file| file.puts JSON.pretty_generate(result) }
end

output = {}
output = winTossWinMatch(matches)
puts output
File.open('../public/output/problem-5.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }

graph = Gruff::Bar.new
graph.x_axis_label = 'team'
graph.y_axis_label = 'team_won_toss_and_won_matches'
graph.y_axis_increment = 10
graph.show_labels_for_bar_values = true
graph.theme = { marker_color: 'black', background_colors: %w[white gray] }
graph.title = 'Team Won Toss And Match'

output.each do |team, win_count|
  graph.data(team, win_count, '#'.concat(Random.bytes(3).unpack1('H*').to_s))
end

graph.write('../plots/5_team_won_toss_and_won_matches.png')
