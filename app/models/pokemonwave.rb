# frozen_string_literal: true

class Pokemonwave < ApplicationRecord
  belongs_to :request
  belongs_to :pokemon

  has_many :pokemons
end
