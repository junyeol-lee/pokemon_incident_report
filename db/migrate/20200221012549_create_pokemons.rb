# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :move
      t.references :pokemonnest, null: false, foreign_key: true
      t.references :request, null: true, foreign_key: false

      t.timestamps
    end
  end
end
