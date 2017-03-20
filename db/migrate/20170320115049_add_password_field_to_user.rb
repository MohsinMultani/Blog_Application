class AddPasswordFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    remove_column :users, :hashed_password, :string
    remove_column :users, :salt, :string
  end
end
