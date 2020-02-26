# frozen_string_literal: true

Rails.application.routes.draw do
  # Requests
  # GET / => requests#index
  root to: 'requests#index'
  # get 'requests', to: 'requests#index'
  # # GET /requests/:id = >requests#show
  # get 'requests/:id', to: 'requests#show', id: /\d+/, as: 'request'
  resources 'requests', only: %i[index show]

  # Pokemons
  # Get all pokemons
  resources 'pokemons', only: %i[index show]

  # Pokemonnest
  resources 'pokemonnests', only: %i[index show]
end
