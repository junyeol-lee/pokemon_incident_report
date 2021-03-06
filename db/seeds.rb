# frozen_string_literal: true

require 'net/http'
require 'json'
# Run this script using: rails db:seed
Page.destroy_all
Pokemonwave.destroy_all
Pokemon.destroy_all
Pokemonnest.destroy_all
Request.destroy_all
require 'soda/client'

NUMBER_OF_REQUESTS = 100
Pokemon_complaints = ['Pokemon attack or bite', 'Pokemon entered house', 'Lost Pokemon', 'Pokemon Noise', 'Exploited pokemon', 'Neglecterd Pokemon'].freeze

# API request for 311 service requests
client = SODA::Client.new(domain: 'data.winnipeg.ca', app_token: 'T8P2t8YpcwEdmk45NmWSyh8ct')
results = client.get('4her-3th5', :$limit => NUMBER_OF_REQUESTS)
requestBody = results.body
# calling historical place API
results = client.get('ptpx-kgiu', :$limit => 50)
historicalPlaceBody = results.body
# End of api call

historicalPlaceBody.each do |_item|
  nest = Pokemonnest.create(historicalName: _item.historical_name,
                            streetName: _item.street_name,
                            streetNumber: _item.street_number,
                            grade: _item.grade,
                            latitude: _item.location.latitude,
                            longitude: _item.location.longitude,
                            constructionDate: _item.construction_date)
  pokemonInfo = Faker::Games::Pokemon.unique
  nest.create_pokemon(name: pokemonInfo.name,
                      move: pokemonInfo.move)
end

requestBody.each do |_item|
  request = Request.create(date: _item.sr_date,
                           serviceArea: _item.service_area,
                           serviceRequest: Pokemon_complaints.sample,
                           latitude: _item.location_1.latitude,
                           longitude: _item.location_1.longitude,
                           neighbourhood: _item.neighbourhood)

  number_of_pokemons = rand(1..5)
  number_of_pokemons.times do
    randomPokemon = Pokemonnest.order('RANDOM()').first
    Pokemonwave.create(request: request,
                       pokemon: randomPokemon.pokemon)
  end
end

Pokemon.all.each do |poke|
  uri = URI('https://pokeapi.co/api/v2/pokemon/' + poke.name.downcase!.gsub(' ', ''))
  pokeImageResponse = Net::HTTP.get(uri)
  if pokeImageResponse != 'Not Found'
    jsonPokeImageResponse = JSON.parse(pokeImageResponse)
    poke.update(imageLink: jsonPokeImageResponse['sprites']['front_default'])
  end
end

Page.create(title: 'About 311', content: '311 Pokemon Service request system.', permalink: 'about_us')
puts "Created #{Pokemonnest.count} pokemonnests."
puts "Created #{Request.count} requests."
puts "Created #{Pokemon.count} kinds pokemons."
