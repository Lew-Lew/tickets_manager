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
Ticket.destroy_all
Message.destroy_all

puts 'Creating 10 fake projects...'
10.times do
  project = Project.new(
    name: Faker::Movie.title,
    description: Faker::Quote.famous_last_words,
    url: Faker::Internet.url
  )
  project.save!
end

puts 'Creating 10 fake tickets per project...'
10.times do
  ticket = Ticket.new(
    description: Faker::Movie.quote,
    statut: "open",
    priority: "2",
    project: Project.all.sample
  )
  ticket.save!
end

puts 'Creating 5 fake messages per ticket...'
5.times do
  message = Message.new(
    content: Faker::Movie.quote,
    ticket: Ticket.all.sample
  )
  message.save!
end


puts 'Finished!'
