# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Product.delete_all
User.delete_all
NUM_PRODUCT = 100
NUM_USER = 10
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

users = User.all

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

NUM_PRODUCT.times do 
    created_at = Faker::Date.backward(days: 365 * 2)
    p = Product.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact,
        price: Faker::Number.decimal(l_digits: 2),
        user: users.sample, #=> 11.88
        created_at: created_at,
        updated_at: created_at
    )
    if p.valid? 
        p.reviews = rand(0..15).times.map do 
          Review.new(body: Faker::GreekPhilosophers.quote, rating: Faker::Number.within(range: 1..5), user: users.sample)
        end
    end
end

