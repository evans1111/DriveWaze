class AddBeginTimeToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :to, :datetime
    add_column :availabilities, :from, :datetime
  end
end
