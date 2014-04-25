require 'sqlite3'
require 'pp'

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE posts
    (
    name string,
    rating integer,
    source_url string,
    date datetime
    )
  }  # %q allows for multiline string in ruby
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  db.execute("INSERT INTO posts(name, rating, source_url, date)
    VALUES('#{post[:name]}', #{post[:rating]}, '#{post[:source_url]}', '#{post[:date]}')")
end

def get_posts(db)
   #TODO: list all posts
   pp db.execute("SELECT * FROM posts")
end

def get_post(db, name)
  #TODO: get a specific post
  pp db.execute("SELECT * FROM posts
    WHERE posts.name == '#{name}'")
end

def update_post(db, name, new_name)
	#TODO: update a post's name in your db
  db.execute("UPDATE posts
    SET name = '#{new_name}'
    WHERE name = '#{name}'")
end

def delete_posts(db)
  #TODO: delete a post in your db
  db.execute("DROP TABLE posts")
  create_scheme(db)
end

def delete_post(db, name)
  #TODO: delete a specific post in your db
  db.execute("DELETE FROM posts
    WHERE posts.name == '#{name}'")
end