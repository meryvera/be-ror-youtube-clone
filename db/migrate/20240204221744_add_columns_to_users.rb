class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :profile_info, :text, limit: 300, null: false
    add_column :users, :avatar, :string

    change_column_null :users, :email, false
    change_column_null :users, :encrypted_password, false
  end
end
