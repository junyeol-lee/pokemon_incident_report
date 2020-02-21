class CreatePokemonnests < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemonnests do |t|
      t.string :historicalName
      t.string :streetName
      t.string :streetNumber
      t.string :grade
      t.string :locationAddress
      t.string :constructionDate

      t.timestamps
    end
  end
end
