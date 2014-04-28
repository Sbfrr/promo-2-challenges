class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.belongs_to  :user
      t.string    :name
      t.datetime  :date
      t.string    :source_url
      t.integer   :rating
    end
  end
end