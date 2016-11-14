# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )

    user.profil = Profil.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      phone_number: Faker::PhoneNumber.cell_phone,
      city:Faker::Address.city,
      country: Faker::Address.country
      ).save

      5.times do
      user.comics.create(
        title: Faker::StarWars.quote,
        editeur: Faker::StarWars.planet,
        artist: Faker::Superhero.name,
        price: (1..3).sample,
        photo: 'les-aventures-de-tintin-serietv-5963.jpg',
        genre: ["adventure", "aviation", "fantastic", "history", "science-fiction", "western", "thriller", "adult", "manga"].sample,
        state: ["Good condition", "Average condition", "Bad condition"].sample

        )



  user.save
end
