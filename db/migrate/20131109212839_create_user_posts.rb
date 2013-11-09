class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.string :content
      t.integer :user_is

      t.timestamps
    end
  end
end
