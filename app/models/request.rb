# frozen_string_literal: true

class Request < ApplicationRecord
  has_one :pokemonwave
  has_many :pokemons, through: :pokemonwaves
  validates :date, :serviceArea, :serviceRequest, :location, :neighbourhood, presence: true
end
