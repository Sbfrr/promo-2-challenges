require_relative "crud"

def ask_and_get(param)
  puts "What is the #{param} for your post?"
  gets.chomp
end

#db_path = File.join(File.dirname(__FILE__), 'db/news.sqlite')
db = SQLite3::Database.new('db/news.sqlite')

create_scheme(db)

while true

  puts "Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Read a specific post"
  puts "4. Update a post"
  puts "5. Delete all posts"
  puts "6. Delete a specific post"
  puts "7. Exit"

  # TODO: add other CRUD tasks if you wish!
	choice =  gets.chomp.to_i

	case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { name: name, source_url: source_url, date: Time.now, rating: rating.to_i }
    create_post(db, post)
  when 2
    get_posts(db)
  when 3
    get_post(db, ask_and_get("name"))
  when 4
    update_post(db, ask_and_get("name"), ask_and_get("new name"))
  when 5
    delete_posts(db)
  when 6
    delete_post(db, ask_and_get("name"))
  when 7
    break
	end

end