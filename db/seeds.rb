require "open-uri"

Request.destroy_all
Notification.destroy_all
Message.destroy_all
ChatParticipant.destroy_all
Chatroom.destroy_all
Event.destroy_all
User.destroy_all

james = URI.open("https://t3.ftcdn.net/jpg/03/28/19/46/360_F_328194664_RKSHvMLgHphnD1nwQYb4QKcNeEApJmqa.jpg")
user = User.new(username: "james", email: "james@gmail.com", password: "123123", description: "I'm from London, I like trekkings and meeting new people", location: "Barcelona Spain", gender:"male", age:"30")
user.photo.attach(io: james, filename: "james.jpg", content_type: "image/jpg")
user.save

john = URI.open("https://t4.ftcdn.net/jpg/02/45/56/35/360_F_245563558_XH9Pe5LJI2kr7VQuzQKAjAbz9PAyejG1.jpg")
user = User.new(username: "john", email: "john@gmail.com", password: "123123", description: "I'm from Paris, I like museums", location: "Barcelona Spain", gender:"male", age:"28")
user.photo.attach(io: john, filename: "john.jpg", content_type: "image/jpg")
user.save

maria = URI.open("https://www.beandbe.com/wp-content/uploads/2016/07/pexels-photo-27411.jpg")
user = User.new(username: "maria", email: "maria@gmail.com", password: "123123", description: "I'm from Berlin, I really enjoy adventures and sports", location: "Barcelona Spain", gender:"female", age:"32")
user.photo.attach(io: maria, filename: "maria.jpg", content_type: "image/jpg")
user.save

paul = URI.open("https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg")
user = User.new(username: "paul", email: "paul@gmail.com", password: "123123", description: "I'm from Italy, I like music", location: "Barcelona Spain", gender:"male", age:"33")
user.photo.attach(io: paul, filename: "paul.jpg", content_type: "image/jpg")
user.save

trekking = URI.open("https://s1.abcstatics.com/media/bienestar/2020/01/29/trekking-kte--1248x698@abc.jpg")
event = Event.new(title: "Trekking in the mountains", description: "Trekking in the morning, amazing views. The trekking is really easy but it takes 6 hours", location: "Val de Nuria, Pyrenees", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)
event.photo.attach(io: trekking, filename: "trekking.jpg", content_type: "image/jpg")
event.save

festival = URI.open("https://upload.wikimedia.org/wikipedia/commons/4/47/024_SonarVillagebyEstrellaDamm_PublicoAmbiente_MartiniAriel_20220617.jpg")
event = Event.new(title: "Sonar Festival", description: "Lest's go to this amazing festival", location: "Parc del forum Barcelona", start_date: "10/10/2023", end_date: "10/10/2023", capacity: "10", user: User.all.sample)
event.photo.attach(io: festival, filename: "festival.jpg", content_type: "image/jpg")
event.save

beach = URI.open("https://costabravahub.com/wp-content/uploads/2023/01/chiropratico-cosa-fa-4.jpg")
event = Event.new(title: "Beach day", description: "Nice day by the beach", location: "Cadaques Barcelona Spain", start_date: "1/10/2023", end_date: "1/10/2023", capacity: "6", user: User.all.sample)
event.photo.attach(io: beach, filename: "beach.jpg", content_type: "image/jpg")
event.save

football = URI.open("https://imagenes.lainformacion.com/files/og_thumbnail_1900/uploads/imagenes/2021/10/14/el-camp-nou.jpeg")
event = Event.new(title: "Football match", description: "Barcelona vs. Real Madrid match", location: "Camp Nou Barcelona Spain", start_date: "20/09/2023", end_date: "20/09/2023", capacity: "10", user: User.all.sample)
event.photo.attach(io: football, filename: "football.jepg", content_type: "image/jepg")
event.save

puts "Seed successfully done"
