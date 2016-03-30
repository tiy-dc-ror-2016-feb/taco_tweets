require 'active_record'

class UserAndTweetMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :bio
      t.string :profile_picture_url
      t.datetime :last_signed_in_at
      t.string :last_signed_in_from
      t.timestamps null: true
    end

    create_table :tweets do |t|
      t.integer :user_id
      t.string :body, limit: 187
      t.integer :likes_count
      t.timestamps null: true
    end
  end
end
