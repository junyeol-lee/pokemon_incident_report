# frozen_string_literal: true

class Pokemon < ApplicationRecord
  belongs_to :pokemonnest
  belongs_to :request, optional: true

  has_many :requests
end
