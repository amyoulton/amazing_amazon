class User < ApplicationRecord
    has_secure_password
    
    has_many :products
    has_many :reviews
    has_many :likes
    has_many :liked_reviews, through: :likes, source: :review

    def full_name 
        "#{first_name} #{last_name}".strip
    end
end
