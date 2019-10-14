# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating Ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
hash = JSON.parse(json)
hash["drinks"].each { |hash| hash.each_value { |ingredient| Ingredient.create(name:ingredient) } }

puts 'Finished!'
