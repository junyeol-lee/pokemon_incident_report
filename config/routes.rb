# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  # GET / => requests#index
  root to: 'requests#index'
  get 'requests', to: 'requests#index'
  # GET /requests/:id = >requests#show

  get 'requests/:id', to: 'requests#show', id: /\d+/, as: 'request'
end
