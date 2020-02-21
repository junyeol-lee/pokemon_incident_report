# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :date
      t.string :serviceArea
      t.string :serviceRequest
      t.string :neighbourhood
      t.string :location

      t.timestamps
    end
  end
end
