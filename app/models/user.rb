class User < ApplicationRecord
    has_one_attached :photo
    has_many :articles
    def full_name
        self.first_name + " " + self.last_name
    end
end
