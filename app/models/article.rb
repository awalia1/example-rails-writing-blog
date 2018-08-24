class Article < ApplicationRecord
	has_one_attached :cover_photo
	validates :title, :content, presence: true
end
