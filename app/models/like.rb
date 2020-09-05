class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review


  validates(
    :review_id,
    uniqueness: {
      scope: :review_id,
      message: "has already been liked"
    }
  )

end
