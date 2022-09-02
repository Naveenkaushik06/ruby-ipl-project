require 'csv'
require 'json'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)

def matchesPerYear(matches)
    result=Hash.new;

    for match in matches
        if(result[match['season']])
          result[match['season']]+=1
        else
          result[match['season']]=1
        end  
    end    
    puts result
    # File.open('../output/1_total_match_per_year.json', 'wb') { |file| file.puts JSON.pretty_generate(result) }
end
matchesPerYear(matches);