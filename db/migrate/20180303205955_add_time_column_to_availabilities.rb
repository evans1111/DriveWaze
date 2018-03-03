class AddTimeColumnToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :avails, :string 
  end
end
