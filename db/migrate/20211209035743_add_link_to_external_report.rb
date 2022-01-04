class AddLinkToExternalReport < ActiveRecord::Migration[7.0]
  def change
    add_column :external_reports, :link, :string
  end
end
