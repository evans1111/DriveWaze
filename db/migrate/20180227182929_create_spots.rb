class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.integer :zip
      t.string :city
      t.string :street
      t.boolean :available
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
