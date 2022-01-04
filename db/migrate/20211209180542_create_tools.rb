class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :name_en
      t.string :name_fr
      t.string :description_en
      t.string :description_fr
      t.string :link

      t.timestamps
    end
  end
end
