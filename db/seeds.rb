# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def self.run
    user = User.create first_name: "sally",
                       last_name: "awesome",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"
    10.times do
      Item.create name: Faker::Hipster.sentence(2),
                  description: Faker::Hipster.paragraph(2),
                  favorites: 0,
                  upvotes: 0,
                  user_id: user.id
    end

    10.times do
      Item.create name: Faker::Hipster.sentence(2),
                  description: Faker::Hipster.paragraph(2),
                  favorites: 5,
                  upvotes: 10,
                  user_id: user.id
    end

    10.times do
      Item.create name: Faker::Hipster.sentence(2),
                  description: Faker::Hipster.paragraph(2),
                  favorites: 0,
                  upvotes: 4,
                  user_id: user.id
    end
  end
end

Seed.run
