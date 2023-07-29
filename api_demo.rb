# require "json"
# require "open-uri"

# puts "Enter you github username:"
# username = gets.chomp

# url = "http://api.github.com/user/#{username}"

# file = URI.open(url).read
# user = JSON.parse.(file)

# puts "Name: #{user['name']}"
# puts "Company: #{user['company']}"
# puts "Location: #{user['location']}"

require "json"
require "open-uri"

puts "Enter your GitHub username:"
username = gets.chomp

url = "https://api.github.com/users/#{username}"

begin
  file = URI.open(url).read
  user = JSON.parse(file)

  puts "Name: #{user['name']}"
  puts "Company: #{user['company']}"
  puts "Location: #{user['location']}"
rescue OpenURI::HTTPError => e
  puts "Error: #{e.message}"
# 
end
