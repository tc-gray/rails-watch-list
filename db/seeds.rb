# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning....'
Movie.destroy_all
puts 'clean!'

10.times do
  Movie.create(
    title: Faker::Movies::HarryPotter.book,
    overview: Faker::Movies::HarryPotter.quote,
    poster_url: 'https://source.unsplash.com/1600x900/?harry,potter',
    rating: rand(1.0..10)
  )
  puts '1 added...'
end

puts 'completed!'
