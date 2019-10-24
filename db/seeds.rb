# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
MessagePrive.destroy_all
Tag.destroy_all
TagGossip.destroy_all
Gossip.destroy_all
City.destroy_all
u = []
c = []
g = []
t = []
10.times do |index|
	c << City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
10.times do |index|
	u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(0..99), city: c.sample)
	puts "User : #{Faker::Name.first_name}"
end
20.times do |index|
	g << Gossip.create(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 20), user: u.sample)
	puts "Gossip : #{Faker::Book.title}"
end
10.times do |index|
	t << Tag.create(title: Faker::Book.title)
	puts "Tag : #{Faker::Book.title}"
end
10.times do |index|
	TagGossip.create(tag: t.sample, gossip: g.sample)
end
2.times do |index|
	m = MessagePrive.new(content:Faker::Lorem.sentence(word_count: 20))
	m.sender = u.sample
	m.recipient = u.sample
	m.save
end