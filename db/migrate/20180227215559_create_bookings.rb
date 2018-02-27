class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.boolean :in_use
      t.references :user, foreign_key: true
      t.references :availability, foreign_key: true

      t.timestamps
    end
  end
end
