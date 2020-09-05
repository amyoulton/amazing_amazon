class Product < ApplicationRecord
    belongs_to :user
    before_validation(:set_default_price)
    before_save(:capitalize_title)

    has_many(:reviews, dependent: :destroy)

    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,
        presence: { message: "must exist" },
        length: { minimum: 10 }
    )
    validates(:price, numericality: { greater_than_or_equal_to: 0, allow_blank: true })


    private

    def set_default_price 
        self.price ||= 1
    end

    def capitalize_title
        self.title = self.title.capitalize
    end
    
end

