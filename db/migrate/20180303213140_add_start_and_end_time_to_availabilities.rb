class AddStartAndEndTimeToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :start_time, :string
    add_column :availabilities, :end_time, :string 
  end
end
