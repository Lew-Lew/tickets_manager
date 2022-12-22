# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning Database"
Project.destroy_all

puts 'Creating 10 fake projects...'
projects = []
10.times do
  project = Project.new(
    name: Faker::Movie.title,
    description: Faker::Quote.famous_last_words,
    url: Faker::Internet.url
  )
  project.save!
  projects << project
end

puts 'Finished!'
