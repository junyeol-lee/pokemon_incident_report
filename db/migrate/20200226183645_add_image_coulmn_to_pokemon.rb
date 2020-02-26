# frozen_string_literal: true

class AddImageCoulmnToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :imageLink, :string
  end
end
