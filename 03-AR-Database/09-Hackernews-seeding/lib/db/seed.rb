require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"
require 'open-uri'
require 'nokogiri'
require 'pp'

# Seed you database with post data from hacker news
# And fake users using Faker gem

puts "Seeding database..."

#TODO: Your code goes here
# 1. create fake users
for i in 0...5  do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users
doc = Nokogiri::HTML(open('https://news.ycombinator.com/'))

name = []
url = []
rating = []

doc.css('.title a').each do |link|
  url  << link['href']
  name << link.inner_text
end

doc.css('.subtext span').each do |link|
  rating << link.inner_text
end

for i in 0...name.length
  Post.create(name: name[i], date: Time.now, source_url: url[i], rating: rating[i], user_id: 1 + rand(5))
end