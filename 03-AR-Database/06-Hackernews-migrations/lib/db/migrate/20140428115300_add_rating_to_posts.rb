class AddRatingToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :rating, :integer
  end

  def down
    remove_column :posts, :rating, :integer
  end
end