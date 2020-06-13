# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Image.destroy_all
Category.destroy_all
Area.destroy_all

wyy = User.create(name: 'wyy', password: '123', zipcode: '07093')
leo = User.create(name: 'leo', password: '123', zipcode: '07093')
lucky = User.create(name: 'lucky', password: '123', zipcode: '07093')
haruki = User.create(name: 'haruki', password: '123', zipcode: '07093') #wny
spike = User.create(name: 'spike', password: '123', zipcode: '10010') #Stuyvesant
user1 = User.create(name: 'amy', password: '123', zipcode: '07087') #union city
user3 = User.create(name: 'chen', password: '123', zipcode: '07310') #jersey city
user4 = User.create(name: 'greg', password: '123', zipcode: '07030') #hoboken
user5 = User.create(name: 'godiva', password: '123', zipcode: '07086') #weehawken
user6 = User.create(name: 'sophia', password: '123', zipcode: '10001') #manhattan
user6 = User.create(name: 'joey', password: '123', zipcode: '11101') #queens


pet = Category.create(name: 'pet adoption')
housing = Category.create(name: 'housing')
marketplace = Category.create(name: 'marketplace')
education = Category.create(name: 'education')
event = Category.create(name: 'event')

wny = Area.create(zipcode: '07093', name: 'West New York')
stuyvesant = Area.create(zipcode: '10010', name: 'Stuyvesant Park')
union_city = Area.create(zipcode: '07087', name: 'Union City')
jersey_city = Area.create(zipcode: '07310', name: 'Jersey City')
hoboken = Area.create(zipcode: '07030', name: 'Hoboken')
weehawken = Area.create(zipcode: '07086', name: 'Weehawken')
manhattan = Area.create(zipcode: '10001', name: 'Manhattan')
queens = Area.create(zipcode: '11101', name: 'Queens')

post1 = Post.create(title: 'sell switch', description: 'i want to sell my switch!', user: wyy, area: wny, category: marketplace)
post2 = Post.create(title: 'teach python', description: 'i am professor python', user: leo, area: wny, category: education)
post3 = Post.create(title: 'baby dog adoption', description: 'cute baby dogs for adoption!', user: lucky, area: wny, category: pet)
post4 = Post.create(title: 'dog show', description: 'welcome all dogs to central park', user: haruki, area: wny, category: event)
post5 = Post.create(title: 'housing', description: 'buy me a new dog home, i tear mine', user: spike, area: stuyvesant, category: housing)

comment1 = Comment.create(content: 'how much?', user: lucky, post: post1)
comment2 = Comment.create(content: 'avaliable now', user: wyy, post: post2)
comment3 = Comment.create(content: 'i want one', user: haruki, post: post3)
comment4 = Comment.create(content: 'can i come?', user: spike, post: post4)
comment5 = Comment.create(content: 'no way', user: leo, post: post5)

image1 = Image.create(image_url: '11111', post: post1)
image2 = Image.create(image_url: '22222', post: post2)
image3 = Image.create(image_url: '33333', post: post3)
image4 = Image.create(image_url: '44444', post: post4)
image5 = Image.create(image_url: '55555', post: post5)
