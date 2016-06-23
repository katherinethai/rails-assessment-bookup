class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provider
    remove_column :users, :uid
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
