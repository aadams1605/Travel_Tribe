# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.delete_all
User.delete_all

User.create(username: "james", email: "james@gmail.com", password: "123123", description: "I like to travel", location: "Barcelona", gender:"male", age:"30")
User.create(username: "john", email: "john@gmail.com", password: "123123", description: "I like to travel", location: "Barcelona", gender:"male", age:"28")
User.create(username: "maria", email: "maria@gmail.com", password: "123123", description: "I like to travel", location: "Barcelona", gender:"female", age:"32")
User.create(username: "paul", email: "paul@gmail.com", password: "123123", description: "I like to travel", location: "Barcelona", gender:"male", age:"33")


Event.create!(title: "Trekking in the mountains", description: "Trekking in the morning, amazing views. The trekking is really easy but it takes 6 hours", location: "Machupicchu", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)
Event.create!(title: "Sonar Festival", description: "Party", location: "Barcelona", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)
Event.create!(title: "Beach day", description: "Nice day by the beach", location: "Barceloneta", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)
Event.create!(title: "Trekking in the mountains", description: "Trekking in the morning, amazing views. The trekking is really easy but it takes 6 hours", location: "Machupicchu", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)

puts "Seed successfully done"
