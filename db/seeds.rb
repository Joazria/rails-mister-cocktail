# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

ingredients = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
parsing_ingredients = JSON.parse(ingredients)

parsing_ingredients["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end


require "open-uri"

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
cocktail = Cocktail.new(name: 'NES', body: "A great console")
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
