require "open-uri"

Request.destroy_all
Notification.destroy_all
Message.destroy_all
ChatParticipant.destroy_all
Chatroom.destroy_all
Event.destroy_all
User.destroy_all

# Create Users:
photo = URI.open("https://t3.ftcdn.net/jpg/03/28/19/46/360_F_328194664_RKSHvMLgHphnD1nwQYb4QKcNeEApJmqa.jpg")
james = User.new(username: "James", email: "james@gmail.com", password: "123123", description: "I'm from London, I like trekkings and meeting new people", location: "Barcelona, Spain", gender:"male", age:"30")
james.photo.attach(io: photo, filename: "James.jpg", content_type: "image/jpg")
james.save!

photo = URI.open("https://t4.ftcdn.net/jpg/02/45/56/35/360_F_245563558_XH9Pe5LJI2kr7VQuzQKAjAbz9PAyejG1.jpg")
john = User.new(username: "John", email: "john@gmail.com", password: "123123", description: "I'm from Paris, I like museums", location: "Barcelona, Spain", gender:"male", age:"28")
john.photo.attach(io: photo, filename: "John.jpg", content_type: "image/jpg")
john.save!

photo = URI.open("https://www.beandbe.com/wp-content/uploads/2016/07/pexels-photo-27411.jpg")
maria = User.new(username: "Maria", email: "maria@gmail.com", password: "123123", description: "I'm from Berlin, I really enjoy adventures and sports", location: "Barcelona, Spain", gender:"female", age:"32")
maria.photo.attach(io: photo, filename: "Maria.jpg", content_type: "image/jpg")
maria.save!

photo = URI.open("https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg")
paul = User.new(username: "Paul", email: "paul@gmail.com", password: "123123", description: "I'm from Italy, I like music", location: "Barcelona, Spain", gender:"male", age:"33")
paul.photo.attach(io: photo, filename: "Paul.jpg", content_type: "image/jpg")
paul.save!

photo = URI.open("https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3763188.jpg&fm=jpg")
julia = User.new(username: "julia", email: "julia@gmail.com", password: "123123", description: "I like adventures and travelling", location: "Paris, France", gender:"female", age:"32")
julia.photo.attach(io: photo, filename: "julia.jpg", content_type: "image/jpg")
julia.save!

photo = URI.open("https://i.pinimg.com/564x/e4/c5/9f/e4c59fdbb41ccd0f87dc0be871d91d98.jpg")
lucas = User.new(username: "lucas", email: "lucas@gmail.com", password: "123123", description: "I love to trekkings and football", location: "London, UK", gender:"male", age:"28")
lucas.photo.attach(io: photo, filename: "lucas.jpg", content_type: "image/jpg")
lucas.save!

photo = URI.open("https://www.mensjournal.com/.image/t_share/MTk2MTM2NTcwNDMxMjg0NzQx/man-taking-selfie.jpg")
steve = User.new(username: "steve", email: "steve@gmail.com", password: "123123", description: "I like sports and nature", location: "Paris, France", gender:"male", age:"28")
steve.photo.attach(io: photo, filename: "steve.jpg", content_type: "image/jpg")
steve.save!

photo = URI.open("https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg")
emma = User.new(username: "emma", email: "emma@gmail.com", password: "123123", description: "I enjoy meeting new people and festivals", location: "London, UK", gender:"female", age:"26")
emma.photo.attach(io: photo, filename: "emma.jpg", content_type: "image/jpg")
emma.save!

# Create Events:
photo = URI.open("https://s1.abcstatics.com/media/bienestar/2020/01/29/trekking-kte--1248x698@abc.jpg")
trekking = Event.new(title: "Trekking in the mountains", description: "Trekking in the morning, amazing views. The trekking is really easy but it takes 6 hours", location: "Val de Nuria, Pyrenees", start_date: DateTime.new(2023,10,10), end_date: DateTime.new(2023,10,10), capacity: 10, user: james)
trekking.photo.attach(io: photo, filename: "trekking.jpg", content_type: "image/jpg")
trekking.save!

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/4/47/024_SonarVillagebyEstrellaDamm_PublicoAmbiente_MartiniAriel_20220617.jpg")
festival = Event.new(title: "Sonar Festival", description: "Lest's go to this amazing festival", location: "Parc del forum Barcelona", start_date: DateTime.new(2023,11,5), end_date: DateTime.new(2023,11,5), capacity: 10, user: maria)
festival.photo.attach(io: photo, filename: "festival.jpg", content_type: "image/jpg")
festival.save!

photo = URI.open("https://costabravahub.com/wp-content/uploads/2023/01/chiropratico-cosa-fa-4.jpg")
beach = Event.new(title: "Beach day", description: "Nice day by the beach", location: "Cadaques Barcelona Spain", start_date: DateTime.new(2023,9,25), end_date: DateTime.new(2023,9,25), capacity: 6, user: john)
beach.photo.attach(io: photo, filename: "beach.jpg", content_type: "image/jpg")
beach.save!

photo = URI.open("https://imagenes.lainformacion.com/files/og_thumbnail_1900/uploads/imagenes/2021/10/14/el-camp-nou.jpeg")
football = Event.new(title: "Football match", description: "Barcelona vs. Real Madrid match", location: "Camp Nou Barcelona Spain", start_date: DateTime.new(2023,10,12), end_date: DateTime.new(2023,10,12), capacity: 10, user: paul)
football.photo.attach(io: photo, filename: "football.jepg", content_type: "image/jepg")
football.save!

photo = URI.open("https://soles.michelin.com/wp-content/uploads/2018/09/Rock-climbing-FB.jpg")
climbing = Event.new(title: "Climbing", description: "Climbing for beginners", location: "Montserrat, Catalunya, Spain", start_date: DateTime.new(2023,10,10), end_date: DateTime.new(2023,10,10), capacity: 10, user: lucas)
climbing.photo.attach(io: photo, filename: "climbing.jpg", content_type: "image/jpg")
climbing.save!

photo = URI.open("https://cdn.sortiraparis.com/images/80/66131/350528-le-musee-du-louvre-coeur-artistique-et-touristique-de-la-capitale.jpg")
louvre = Event.new(title: "Louvre museum", description: "Cultural day at Louvre museum", location: "75001 Paris, Francia", start_date: DateTime.new(2023,11,7), end_date: DateTime.new(2023,11,7), capacity: 10, user: steve)
louvre.photo.attach(io: photo, filename: "louvre.jpg", content_type: "image/jpg")
louvre.save!

photo = URI.open("https://barcelonaexclusiveprivatetours.com/assets/iblog/post/gallery/128/dali-museum-tour-from-barcelona-3.jpg")
dali = Event.new(title: "Dali Museum", description: "A day in Dali's museum", location: "Plaça Gala i Salvador Dalí, 5, 17600 Figueres, Girona, Spain", start_date: DateTime.new(2023,9,28), end_date: DateTime.new(2023,9,28), capacity: 6, user: emma)
dali.photo.attach(io: photo, filename: "dali.jpg", content_type: "image/jpg")
dali.save!

photo = URI.open("https://www.planetware.com/photos-large/F/france-eiffel-tower.jpg")
eiffel = Event.new(title: "Eiffel Tower", description: "Visiting the Eiffel Tower at night", location: "Champ de Mars, 5 Av. Anatole France, 75007 Paris, France", start_date: DateTime.new(2023,10,30), end_date: DateTime.new(2023,10,30), capacity: 10, user: julia)
eiffel.photo.attach(io: photo, filename: "eiffel.jepg", content_type: "image/jepg")
eiffel.save!

# Create Requests:
request_james_festival = Request.create!(status: "accepted", event: festival, user: james)
request_john_festival = Request.create!(status: "accepted", event: festival, user: john)
request_emma_festival = Request.create!(status: "accepted", event: festival, user: emma)
request_steve_festival = Request.create!(status: "accepted", event: festival, user: steve)
request_john_trekking = Request.create!(status: "accepted", event: trekking, user: john)
request_paul_trekking = Request.create!(status: "accepted", event: trekking, user: paul)

# Create Chat:
chat_james_maria = Chatroom.create!(is_direct: true)
ChatParticipant.create!(user: james, chatroom: chat_james_maria)
ChatParticipant.create!(user: maria, chatroom: chat_james_maria)
message_james_to_maria = Message.create!(chatroom: chat_james_maria, user: james, content: "Hello, Maria!", created_at: DateTime.new(2023,9,6,14,30))
message_maria_to_james = Message.create!(chatroom: chat_james_maria, user: maria, content: "Hello, James! How are you?", created_at: DateTime.new(2023,9,6,14,32))

# Create Notification:
Notification.create!(
  content: "Your request to join the event: #{request_james_festival.event.title} has been Accepted",
  user: request_james_festival.user,
  notifiable_type: request_james_festival.event.class.name,
  notifiable_id: request_james_festival.event.id
)
Notification.create!(
  content: "Your request to join the event: #{request_john_festival.event.title} has been Accepted",
  user: request_john_festival.user,
  notifiable_type: request_john_festival.event.class.name,
  notifiable_id: request_john_festival.event.id
)
Notification.create!(
  content: "Your request to join the event: #{request_emma_festival.event.title} has been Accepted",
  user: request_emma_festival.user,
  notifiable_type: request_emma_festival.event.class.name,
  notifiable_id: request_emma_festival.event.id
)
Notification.create!(
  content: "Your request to join the event: #{request_steve_festival.event.title} has been Accepted",
  user: request_steve_festival.user,
  notifiable_type: request_steve_festival.event.class.name,
  notifiable_id: request_steve_festival.event.id
)
Notification.create!(
  content: "Your request to join the event: #{request_john_trekking.event.title} has been Accepted",
  user: request_john_trekking.user,
  notifiable_type: request_john_trekking.event.class.name,
  notifiable_id: request_john_trekking.event.id
)
Notification.create!(
  content: "Your request to join the event: #{request_paul_trekking.event.title} has been Accepted",
  user: request_paul_trekking.user,
  notifiable_type: request_paul_trekking.event.class.name,
  notifiable_id: request_paul_trekking.event.id
)
Notification.create!(
  content: "You have a new message from #{james.username}",
  user: maria,
  notifiable_type: message_james_to_maria.class.name,
  notifiable_id: message_james_to_maria.id
)
Notification.create!(
  content: "You have a new message from #{maria.username}",
  user: james,
  notifiable_type: message_maria_to_james.class.name,
  notifiable_id: message_maria_to_james.id
)

puts "Seed successfully done"
