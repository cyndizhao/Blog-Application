# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Category.create name: Faker::Music.instrument
end

10.times do
  User.create first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password: "12345678",
            password_confirmation: "12345678"
end

10.times do
  Post.create title: Faker::Lorem.word,
              body: Faker::Hipster.paragraph,
              category: Category.all.sample,
              user: User.all.sample

end

10.times do
  Comment.create body: Faker::Hipster.paragraph,
                post: Post.all.sample,
                user: User.all.sample
end
puts'Created data!'
