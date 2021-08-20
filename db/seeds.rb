# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'cleaning....'
Bookmark.destroy_all
Movie.destroy_all
puts 'clean!'

# 10.times do
#   Movie.create(
#     title: Faker::Movies::HarryPotter.book,
#     overview: Faker::Movies::HarryPotter.quote,
#     poster_url: 'https://source.unsplash.com/1600x900/?harry,potter',
#     rating: rand(1.0..10)
#   )
#   puts '1 movie added...'
# end

CONFIG = 'http://tmdb.lewagon.com/configuration'
URL = 'http://tmdb.lewagon.com/movie/top_rated'

config_json = URI.open(CONFIG).read
config = JSON.parse(config_json)

movies_json = URI.open(URL).read
movies = JSON.parse(movies_json)

base_url = config['images']['base_url']
# image_url = "#{base_url}" + "#{movies['poster_path']}"

movies['results'].each do |movie|
  image_url = "#{base_url}" + "w342" + "#{movie['poster_path']}"
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: image_url,
    rating: rand(1.0..10)
  )
  puts image_url
  puts 'movie added......'
end



# List.create(name: 'Comedies')
# List.create(name: 'Horrors')
# List.create(name: 'Classics')
