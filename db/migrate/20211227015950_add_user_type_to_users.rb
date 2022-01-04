class AddUserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :integer, default: 0, null: false
    remove_column :users, :admin
  end
end
