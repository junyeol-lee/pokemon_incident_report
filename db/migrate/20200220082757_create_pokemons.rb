class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :move
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
