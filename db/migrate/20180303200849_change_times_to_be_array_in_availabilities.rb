class ChangeTimesToBeArrayInAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :time_slot, :string, default: [].to_yaml
  end
end
