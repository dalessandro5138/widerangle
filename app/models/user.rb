class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true

	has_many :user_posts
end
