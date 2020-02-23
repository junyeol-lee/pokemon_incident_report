# frozen_string_literal: true

# Run this script using: rails db:seed
Pokemonwave.destroy_all
Pokemon.destroy_all
Pokemonnest.destroy_all
Request.destroy_all
require 'soda/client'

NUMBER_OF_REQUESTS = 10

# API request for 311 service requests
client = SODA::Client.new(domain: 'data.winnipeg.ca', app_token: 'T8P2t8YpcwEdmk45NmWSyh8ct')
results = client.get('4her-3th5', :$limit => NUMBER_OF_REQUESTS)
requestBody = results.body
# calling historical place API
results = client.get('ptpx-kgiu', :$limit => 10)
historicalPlaceBody = results.body
# End of api call

historicalPlaceBody.each do |_item|
  nest = Pokemonnest.create(historicalName: _item.historical_name,
                            streetName: _item.street_name,
                            streetNumber: _item.street_number,
                            grade: _item.grade,
                            locationAddress: _item.location_address,
                            constructionDate: _item.construction_date)
  pokemonInfo = Faker::Games::Pokemon.unique
  nest.create_pokemon(name: pokemonInfo.name,
                      move: pokemonInfo.move)
end

requestBody.each do |_item|
  request = Request.create(date: _item.sr_date,
                           serviceArea: _item.service_area,
                           serviceRequest: _item.service_request,
                           location: _item.location_1.latitude + ' ' + _item.location_1.longitude,
                           neighbourhood: _item.neighbourhood)

  number_of_pokemons = rand(1..10)
  number_of_pokemons.times do
    randomPokemon = Pokemonnest.order('RANDOM()').first
    Pokemonwave.create(request: request,
                       pokemon: randomPokemon.pokemon)
  end
end

puts "Created #{Pokemonnest.count} pokemonnests."
puts "Created #{Request.count} requests."
puts "Created #{Pokemon.count} kinds pokemons."
