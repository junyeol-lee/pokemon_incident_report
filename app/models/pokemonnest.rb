# frozen_string_literal: true

class Pokemonnest < ApplicationRecord
  has_one :pokemon

  # validates :historicalName, :streetName, :streetNumber, :grade, :locationAddress, :constructionDate, presence: true
end
