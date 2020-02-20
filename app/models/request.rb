# frozen_string_literal: true

class Request < ApplicationRecord
  has_many :pokemons
  validates :date, :serviceArea, :serviceRequest, :location, presence: true
end
