class Article < ApplicationRecord
	has_one_attached :cover_photo
	belongs_to :user
	validates :title, :content, presence: true
end
