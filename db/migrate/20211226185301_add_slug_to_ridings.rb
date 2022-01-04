class AddSlugToRidings < ActiveRecord::Migration[7.0]
  def change
    add_column :ridings, :slug, :string
    add_index :ridings, :slug, unique: true
  end
end
