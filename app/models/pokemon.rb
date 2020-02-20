# frozen_string_literal: true

class Pokemon < ApplicationRecord
  belongs_to :request # One to many association

  validates :name, presence: true
  # The FK is also required.
end
