# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create!(body: "How do I use rspec?", details: "As a user, I would like to learn how to use rspec for my testing.")
Question.create!(body: "How do I implement FactoryGirl on rspec?", details: "I know how to use rspec, but how do I implement Factory Girl?")
Question.create!(body: "where is the intro to Ruby on Rails?", details: "I was thinking about switching from Python & Django to Ruby on Rails. Where is the intro?")
