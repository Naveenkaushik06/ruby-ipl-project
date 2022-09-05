# Find the strike rate of a batsman for each season
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'), headers: true)
