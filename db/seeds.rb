# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
j = User.create(first_name: "Justin", last_name: "Davies", email: "justin@gmail.com", password: "password")

j.dogs.create(name:"trip",breed:"pitbull",age:"7",gender:"male",weight:"60",intact:"true",birthday:"12/04/2014")

JournalEntry.create(title: "Test", entry:"This is a test entry", date:"07/14/2020",dog_id: 1, user_id: 1)

l = User.create(first_name: "Lucy", last_name: "Matson", email: "lucy@gmail.com", password: "password")

l.dogs.create(name:"ava",breed:"pitbull mix",age:"3",gender:"female",weight:"45",intact:"true",birthday:"01/01/2017")

JournalEntry.create(title: "Test2", entry:"This is a test entry2", date:"07/14/2020",dog_id: 2, user_id: 2)