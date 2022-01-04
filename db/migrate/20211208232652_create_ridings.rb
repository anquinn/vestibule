class CreateRidings < ActiveRecord::Migration[7.0]
  def change
    create_table :ridings do |t|
      t.string :name_en
      t.string :name_fr
      t.string :riding_code
      t.string :province_en
      t.string :province_fr
      t.string :member_name_en
      t.string :member_name_fr
      t.string :member_affiliation_en
      t.string :member_affiliation_fr
      t.string :riding_type_en
      t.string :riding_type_fr
      t.string :region_en
      t.string :region_fr

      t.timestamps
    end
  end
end
