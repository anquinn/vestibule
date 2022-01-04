class CreateBankBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_balances do |t|
      t.integer :balance_cents, null: false, default: 0
      t.references :riding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
