class CreatePokemonwaves < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemonwaves do |t|
      t.references :request, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
