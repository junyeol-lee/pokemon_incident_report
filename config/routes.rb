# frozen_string_literal: true

Rails.application.routes.draw do
  # GET / => requests#index
  root to: 'requests#index'

  # GET /requests/:id = >requests#show

  get 'requests/:id', to: 'requests#show', id: /\d+/
end
