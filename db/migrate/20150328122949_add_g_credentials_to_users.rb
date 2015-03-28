class AddGCredentialsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :firstname
    remove_column :users, :lastname
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end
