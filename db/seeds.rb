# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flight.delete_all
Airport.delete_all

2.times do
  Airport.create(country: Faker::Address.country,
                 city: Faker::Address.city,
                 name: Faker::Name.unique.name,
                 code: [*'A'..'Z'].sample(3).join)
end

1000.times do
  flight = Flight.new(time: rand(1..7).day.from_now.to_date,
                      max_passenger: rand(60..500),
                      passenger_count: 0,
                      duration_min: rand(45..900))

  flight.departure = Airport.all.sample
  flight.arrival = Airport.where.not(id: flight.departure.id).all.sample
  flight.save
end
