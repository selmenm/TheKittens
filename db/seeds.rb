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


puts "\n"*2
puts "$" *60
puts "Seed of table Breed"
7.times do |i|
	print "\r#{i+1} breeds created over 7"
	Breed.create(
		name: Faker::Creature::Cat.breed
	)
end
puts "\nSeed of table Breed has been successfully performed (7/7)"


puts "\n"*2
puts "$" *60
puts "Seed of table Item"
i = 1
5.times do 
	print "\r#{i+1} items created over 100"
	cat_pictures_array.each do |cat_pic|
		Item.create(
			title: Faker::Creature::Cat.name,
			breed: Breed.all.sample,
			description: Faker::Lorem.paragraph,
			price: Faker::Number.decimal(2),
			image_url: cat_pic
		)
	end
	i +=1
end
puts "\nSeed of table Item has been successfully performed (100/100)"

puts "\n"*2
puts "$" *60
puts "\nSeed of table User and Cart (four carts per user)"
j = 1
20.times do |i|
	User.create(
		gender: Faker::Gender.binary_type,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		username: Faker::Space.moon,
		age: rand(18..99),
		password: "aaaaaa",
		email: Faker::Internet.email
	)
	4.times do
		print "\r #{i} users created over 20 // #{j+1} carts created over 100"
		Cart.create(
			user_id: i+1,
			item: Item.all.sample,
			quantity: rand(1..10)
		)
		j += 1
	end
end
puts "\nSeed of table User & Cart have been successfully performed (resp. 20/20 & 100/100)"

puts "\n"*2
puts "$" *60
puts "Addition of the admin (pseudo: admin & password: aaaaaa"
User.create(
	gender: "Male",
	first_name: "Admin",
	last_name: "kittens",
	username: "admin",
	age: 95,
	password: "aaaaaa",
	email: "adminkittens@gmail.com",
	is_admin: true
)
puts "Creation of the admin has been successfully performed"


# puts "\n"*2
# puts "$" *60
# puts "Seed of table Order"
# 20.times do |i|
# 	print "\r#{i+1} orders created over 20"
# 	Order.create(
# 		stripe_id: "CustStripeMaGueule",
# 		user: User.all.sample
# 	)
# end
# puts "\nSeed of table Order has been successfully performed (20/20)"



puts "\n"*2
puts "$" *60
puts "Seed of table Review"
600.times do |i|
	print "\r#{i+1} reviews created over 600"
	Review.create(
		rating: rand(1..5),
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		item: Item.all.sample,
		user: User.all.sample
	)
end
puts "\nSeed of table Review has been successfully performed (600/600)"

puts "\n"*2
puts "$" *60
puts "End of Seed"
puts "$" *60
puts "\n"*2