# frozen_string_literal: true

class Pokemon < ApplicationRecord
  belongs_to :pokemonnest

  has_many :pokemonwaveds
  has_many :requests, through: :pokemonwaves

  validates :name, :move, presence: true
end
