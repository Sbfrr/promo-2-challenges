require_relative 'config/application'
require_relative 'app/models/post'
require_relative 'app/models/user'
require_relative 'post_action'

class HackerNewsUI

  def self.possible_actions

    @actions ||= [

      # Action to see all posts
      PostAction.new('See all posts') do |user|
        posts = Post.all
        posts.each do |post|
          puts "#{post.id} -- #{post.name} - #{post.source_url} - #{post.rating} - #{User.find(post.user_id).name} \n "
        end
      end,

      # Action to vote for a post
      PostAction.new('Vote for a post') do |user|
        post = Post.find(HackerNewsUI.ask_and_get("id"))
        post.rating += 1
        post.save
        puts "Post #{post.id} : #{post.name} was successfully voted. Current vote is #{post.rating}."
      end,

      # Action for a user to see his own post
      PostAction.new('See your own posts') do |user|
        posts = Post.where(user_id: user[0].id)
        posts.each do |post|
          puts "#{post.id} -- #{post.name} - #{post.source_url} - #{post.rating} - #{User.find(post.user_id).name} \n "
        end
      end,

      # Action to submit a new post
      PostAction.new('Submit new post') do |user|
        name = HackerNewsUI.ask_and_get("name")
        source_url = HackerNewsUI.ask_and_get("source url")
        rating = HackerNewsUI.ask_and_get("rating")
        Post.create(name: name, source_url: source_url, date: Time.now, rating: rating, user_id: user[0].id)
      end,

      # Action to delete a post
      PostAction.new('Delete a post') do |user|
        post = Post.find(HackerNewsUI.ask_and_get("id"))
        puts "#{post.id} -- #{post.name} - #{post.source_url} - #{post.rating} - #{User.find(post.user_id).name} \n "
        post.destroy
      end,

    ]

  end


  def self.ask_and_get(param)
    puts "What is the #{param} of your piece of news?"
    gets.chomp
  end


  def self.start_ui

    puts "Welcome to Wagon-Hacker-News!\n"
    actions = possible_actions

    while true
      user = nil
      wrong_email = true

      # Identification loop
      while user.nil? or wrong_email
        print 'Please identify yourself: '
        print '> '
        name = gets.chomp
        user = User.find_by(name: "#{name}")

        if user
          puts "All right #{user.name}, enter your email:"
          print '> '
          email = gets.chomp
          wrong_email = email != user.email
          puts 'Incorrect email! Try again please.' if wrong_email
        end
      end

      while true

        puts "\n Hey #{user.name}, what do you want to do today? Enter <task_id> \n"
        possible_actions.each do |action|
          puts "#{possible_actions.index(action) + 1}. #{action.title}"
        end
        puts "#{possible_actions.length + 1}. Exit"

        print '> '
        choice =  gets.chomp.to_i

        if choice < 1 || choice > possible_actions.length
          puts "Unvalid <id> , try ragain"
          redo
        elsif choice == possible_actions.length
          break
        else
          possible_actions[choice - 1].run(user)
        end

      end

      puts "Bye bye my dear!"
    end
  end
end

HackerNewsUI.start_ui
#TODO: that's the entry point of your app.
