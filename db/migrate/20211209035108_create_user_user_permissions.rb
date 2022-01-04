class CreateUserUserPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_user_permissions do |t|
      t.references :user_permission, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
