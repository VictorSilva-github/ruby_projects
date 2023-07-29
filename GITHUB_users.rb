require "json"
require "open-uri"


puts "What is your github username?"
user_name = gets.chomp  

url = "https://api.github.com/users/#{user_name}"
file = open(url).read
our_hash = JSON.parse(file) 
puts "Welcome #{our_hash["name"]}"
puts "Check out your repos at #{our_hash["repos_url"]}"