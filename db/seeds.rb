require 'json'
require 'open-uri'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 0128e3a038858e8ef64aa5880d13e2ce

puts 'cleaning db'
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all
puts "db cleared"

seed_array = [
  {genre: "horror", id: 27, image: "https://res.cloudinary.com/dzfjdlafz/image/upload/v1720525828/ao5xjldiw66z9v4tq9l0.jpg"},
  {genre: "music", id: 10402, image: "https://res.cloudinary.com/dzfjdlafz/image/upload/v1720525945/v0khp3r03nhhs2y9spxp.jpg"},
  {genre: "mystery", id: 9648, image: "https://res.cloudinary.com/dzfjdlafz/image/upload/v1720526023/n9rfhywtpcwvjkf6hpnd.jpg"}]

seed_array.each do |genre|
  puts "creating #{genre[:genre]} movies"
  url = "https://api.themoviedb.org/3/discover/movie?api_key=0128e3a038858e8ef64aa5880d13e2ce&with_genres=#{genre[:id]}"
  movies = JSON.parse(URI.open(url).read)["results"]
  movies.each do |movie|
    unless Movie.find_by(title: movie["original_title"])
      Movie.create!(
        title: movie["original_title"],
        overview: movie["overview"],
        poster_url: "https://image.tmdb.org/t/p/w200#{movie["poster_path"]}",
        rating: movie["vote_average"].ceil(1),
        backdrop_url: "https://image.tmdb.org/t/p/w500#{movie["backdrop_path"]}",
        genre: genre[:genre]
      )
    end
  end
  puts "Created #{genre[:genre]} movies!"

  List.create!(
    name: genre[:genre],
    creator: "Aya F."
  )
  puts "created #{genre[:genre]} list!"

  list_array = []
  rand(10..20).times do
    sample_movie = Movie.where(genre: genre[:genre]).sample
    if !list_array.include?(sample_movie)
      Bookmark.create!(
        comment: Faker::Lorem.paragraph,
        movie: sample_movie,
        list: List.find_by(name: genre[:genre])
      )
      list_array.push(sample_movie)
    end
  end
  puts "created bookmarks"
  file = URI.open(genre[:image])
  List.last.image.attach(io: file, filename: "#{genre[:genre]}.jpg")
end
