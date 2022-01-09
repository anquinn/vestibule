class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :title_en
      t.string :title_fr
      t.text :body_en
      t.text :body_fr

      t.timestamps
    end
  end
end
