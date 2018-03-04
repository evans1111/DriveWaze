class AddAvailableToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :avialable, :boolean, default: true #when user creates new avail for spot - default to open (true)
  end
end
