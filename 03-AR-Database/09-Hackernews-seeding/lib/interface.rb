require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

class HackerNewsUI

  #TODO: build your interface with login and CRUD tasks on the posts
  def self.ask_and_get(param)
    puts "What is the #{param} of your piece of news?"
    gets.chomp
  end

  def self.start_ui

    while true
      user = nil
      wrong_email = true

      # Identification loop
      while user.nil? or wrong_email
        print 'Please identify yourself: '
        name = gets.chomp
        user = User.find_by(name: "#{name}")

        if user
          puts "All right #{user.name}, enter your email:"
          print '> '
          email = gets.chomp
          wrong_email = email != user.email
          puts 'Incorrect email!!' if wrong_email
        end
      end

      while true

        puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
        puts "1. Create a post"
        puts "2. Read your posts"
        puts "3. Delete all posts"
        puts "4. Exit"

        choice =  gets.chomp.to_i

        case choice
        when 1
          name = HackerNewsUI.ask_and_get("name")
          source_url = HackerNewsUI.ask_and_get("source url")
          rating = HackerNewsUI.ask_and_get("rating")
          #post = { name: name, source_url: source_url, date: Time.now, rating: rating }
          #TODO: use ActiveRecord to add a new post for the user logged in!
          Post.create(name: name, source_url: source_url, date: Time.now, rating: rating, user_id: user.id)
        when 2
          #TODO: use ActiveRecord to get all posts of the current user
          posts = Post.all
          posts.each do |post|
            puts "#{post.id} -- #{post.name} - #{post.source_url} - #{post.rating} - #{User.find(post.user_id).name} \n "
          end
        when 3
          #TODO: use ActiveRecord to delete all posts of current user
          Post.destroy_all
        when 4
          break
        end
      end

    end
  end
end

HackerNewsUI.start_ui