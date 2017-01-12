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

    9.times do
      Item.create name: Faker::Beer.name,
                  description: Faker::Hipster.paragraph(2),
                  user_id: user.id
    end
  end
end

Seed.run
