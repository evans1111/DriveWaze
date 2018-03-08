class AddPublishableKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :publishable_key, :string
      add_column :users, :provider, :string
      add_column :users, :uid, :string
      add_column :users, :access_code, :string
  end
end
