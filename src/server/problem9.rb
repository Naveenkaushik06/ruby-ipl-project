# Find the bowler with the best economy in super overs
require 'csv'
require 'json'
require 'gruff'
matches = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/matches.csv'), headers: true)
deliveries = CSV.parse(File.read('/home/naveen/Desktop/ruby-ipl-project/src/data/deliveries.csv'), headers: true)

