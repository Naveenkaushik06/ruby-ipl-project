require 'csv'
require 'json'
matches = CSV.parse(File.read('/home/himanshu/Desktop/Ruby/ruby_ipl_project/Data/matches.csv'), headers: true)
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
         puts obj
         File.open('../output/6_highest_player_of_match.json', 'wb') { |file| file.puts JSON.pretty_generate(obj) }

end
  winsPerTeam(matches)