class CreateEmailPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :email_plans do |t|
      t.integer :status, default: 0, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :size
      t.integer :suggested_list_size
      t.integer :current_subscribes
      t.references :riding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
