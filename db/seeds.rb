# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bundler'
Bundler.require

cat_pictures_array = 
[
	"https://image.noelshack.com/fichiers/2019/10/1/1551696770-cat1.jpg", 
	"https://image.noelshack.com/fichiers/2019/10/1/1551696769-cat2.jpg", 
	"https://image.noelshack.com/fichiers/2019/10/1/1551696770-cat3.jpg", 
	"https://image.noelshack.com/fichiers/2019/10/1/1551696770-cat4.jpg", 
	"https://image.noelshack.com/fichiers/2019/10/1/1551696770-cat5.jpg", 
	"https://image.noelshack.com/fichiers/2019/10/1/1551696769-cat6.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696811-cat7.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696812-cat8.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696811-cat9.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696812-cat10.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696812-cat11.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551696812-cat12.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697050-cat13.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697051-cat14.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697051-cat15.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697051-cat16.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697051-cat17.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697051-cat18.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697081-cat19.jpg",
	"https://image.noelshack.com/fichiers/2019/10/1/1551697081-cat20.jpg"
]

User.create(first_name: "Admin", last_name: "kittens", username: "admindusite", age: 95, password: "VyM123456AbN", email: "adminkittens@gmail.com", is_admin: true)

19.times do
	User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		username: Faker::Space.moon,
		age: rand(18..99),
		password: "Loveeeeee",
		email: Faker::Internet.email
	)
end

cat_pictures_array.each do |cat_pic|
	Item.create(
	title: Faker::Hipster.words,
	description: Faker::Lorem.paragraph,
	price: Faker::Number.decimal(2),
	image_url: cat_pic
	)
end

20.times do
	Order.create(stripe_id: "CustStripeMaGueule")
end

20.times do
	Review.create(rating: rand(1..5), title: Faker::Book.title, content: Faker::Lorem.paragraph, item_id: rand(1..15), user_id: rand(1..15))
end

20.times do
	Cart.create(user_id: rand(1..15), order_id: rand(1..15), item_id: rand(1..15), quantity: rand(1..10))
end



