class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.DateTime :Date
      t.string :serviceArea
      t.string :serviceRequest
      t.string :neighborhood
      t.string :location

      t.timestamps
    end
  end
end
