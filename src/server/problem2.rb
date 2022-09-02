require 'csv'
# require 'json'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
def winsPerTeam(matches)
     obj=Hash.new;
          for year in matches
          if(obj[year['winner']]) 
              if(obj[year['winner']][year['season']])
              obj[year['winner']][year['season']]+=1;
              else
              obj[year['winner']][year['season']]=1;
              end
         else
         obj[year['winner']]={};
         obj[year['winner']][year['season']]=1;
         end  
        end
         puts obj
        #  File.open('../output/2_match_won_per_team_per_year.json', 'wb') { |file| file.puts JSON.pretty_generate(obj) }

end
winsPerTeam(matches);