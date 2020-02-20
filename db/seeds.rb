# frozen_string_literal: true

# Run this script using: rails db:seed
Pokemon.destroy_all
Request.destroy_all
require 'soda/client'

NUMBER_OF_REQUESTS = 10

# API request for 311 service requests
client = SODA::Client.new(domain: 'data.winnipeg.ca', app_token: 'T8P2t8YpcwEdmk45NmWSyh8ct')
results = client.get('4her-3th5', :$limit => NUMBER_OF_REQUESTS)
311RequestBody = results.body
#calling historical place API
client = SODA::Client.new({:domain => "data.winnipeg.ca", :app_token => "T8P2t8YpcwEdmk45NmWSyh8ct"})
results = client.get("ptpx-kgiu", :$limit => 50)
historicalPlaceBody = results.body
# End of api call

311RequestBody.each do |_item|
  request = Request.create(date: _item.sr_date,
                           serviceArea: _item.service_area,
                           serviceRequest: _item.service_request,
                           location: [_item.location_1.latitude, _item.location_1.longitude],
                           neighbourhood: _item.neighbourhood)

  number_of_pokemons = rand(1..10)
  number_of_pokemons.times do
    pokemon = Faker::Games::Pokemon
    request.pokemons.create(name: pokemon.name,
                            move: pokemon.move)
  end
end


puts "Created #{Request.count} requests."
puts "Created #{Pokemon.count} pokemons"
