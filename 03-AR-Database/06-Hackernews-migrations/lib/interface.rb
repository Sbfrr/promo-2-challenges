require_relative 'config/application'
require_relative 'crud'
require 'pp'


def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end


db = SQLite3::Database.new(DB_PATH.to_s)

while true

  puts "Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

	choice =  gets.chomp.to_i

	case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { name: name, source_url: source_url, date: Time.now, rating: rating }
    create_post(db, post)
  when 2
    posts = get_posts(db)
    #TODO: prints nicely the results from DB queries (you could use #strftime to format datetime display)
    posts.each do |post|
      puts "#{post[0]} -- #{post[1]} - #{post[2]} - #{Time.parse(post[3]).strftime("%Y/%m/%d")} - #{post[4]} \n"
    end
  when 3
    delete_post(db, ask_and_get("id"))

  #TODO: add other CRUD tasks to your interface if you wish!
  when 4
    break
	end

end

