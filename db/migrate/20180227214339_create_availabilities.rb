class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.integer :times
      t.references :spot

      t.timestamps
    end
  end
end
