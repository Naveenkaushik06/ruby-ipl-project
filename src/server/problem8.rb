# Find the highest number of times one player has been dismissed by another player




# Top 10 economical bowlers in the year 2015
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'), headers: true)


def top10EconomyBowlerIn2015(matches, deliveries)
    top10economy = {}
    for matchdata in matches
        id = matchdata['id']
        matchdata['season'] === 'year >= 2008 && year <= 2017'
        for deliverdata in deliveries
            if deliverdata['match_id'] === id
                if economy[deliverdata['bowling_team']]
                    economy[deliverdata['bowling_team']] += deliverdata['season'].to_i
                else
                    economy[deliverdata['bowling_team']] = deliverdata['season'].to_i
                end
            end
        end
    end
    return top10economy
end 
            
output = {}
output = top10EconomyBowlerIn2015(matches, deliveries)
puts output
File.open('../public/output/problem-4.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }

      id = matchdata['id']
        matchdata['season'] === 'year >= 2008 && year <= 2017'
        for deliverdata in deliveries
            if deliverdata['match_id'] === id
                if economy[deliverdata['bowling_team']]
                    economy[deliverdata['bowling_team']] += deliverdata['season'].to_i
                else
                    economy[deliverdata['bowling_team']] = deliverdata['season'].to_i
                end
            end
        end
    end
    return top10economy
end 
            
output = {}
output = top10EconomyBowlerIn2015(matches, deliveries)
puts output
File.open('../public/output/problem-4.json', 'wb') { |file| file.puts JSON.pretty_generate(output) }
