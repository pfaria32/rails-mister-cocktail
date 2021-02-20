require 'faker'


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
number = 0
ingredients_list = open(url).read

ingredients = JSON.parse(ingredients_list)
puts "creating ingredients........."

ingredients['drinks'].each do |ingredient|
  new_ingredient = Ingredient.create!(name: ingredient['strIngredient1'])
  number += 1
  puts "#{number}. #{new_ingredient.name} created"
end

20.times do
  cocktail = Cocktail.create!(name: Faker::Coffee.unique.blend_name)
  rand(3..7).times do

    possible_ingredient = Ingredient.all.sample

    possible_ingredient = ingredient.all.sample while cocktail.ingredients. include?(possible_ingredient)

    Dose.create(
      cocktail: cocktail,
      ingredient: Ingredient.all.sample,
      description: Faker::ChuckNorris
    )
  end
  puts "#{cocktail.new} created"
end

review = Review.create(
  cocktail: Coctail.all.sample,
  content: Faker::Hipster.paragraph,
  rating: rand(0.00..5.99).round(1),
  user: Faker::GreekPhilodophers.name
)
puts "#{review.user} has reviewed #{review.cocktail.name}"

