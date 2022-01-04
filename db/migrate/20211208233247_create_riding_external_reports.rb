class CreateRidingExternalReports < ActiveRecord::Migration[7.0]
  def change
    create_table :riding_external_reports do |t|
      t.references :riding, null: false, foreign_key: true
      t.references :external_report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
