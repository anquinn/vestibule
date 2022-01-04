class RemoveLinkFromExternalReports < ActiveRecord::Migration[7.0]
  def change
    remove_column :external_reports, :link
    add_column :riding_external_reports, :link, :string
  end
end
