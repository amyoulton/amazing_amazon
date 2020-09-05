class ProductSerializer < ActiveModel::Serializer
  attributes( 
    :id,
    :title,
    :description,
    :price
  )

  belongs_to :user, key: :seller
  has_many :reviews

  class UserSerializer < ActiveModel::Serializer
    attributes(
      :id,
      :first_name,
      :last_name,
      :email,
      :full_name
    )
  end

end
