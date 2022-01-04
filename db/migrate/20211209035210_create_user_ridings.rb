class CreateUserRidings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ridings do |t|
      t.references :riding, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
