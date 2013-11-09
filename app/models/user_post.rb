class UserPost < ActiveRecord::Base
	validates :content, length: { maximum: 1000 }
	validates :content, presence: true

	belongs_to :user
end
