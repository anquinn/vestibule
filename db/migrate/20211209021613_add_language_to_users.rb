class AddLanguageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_language, :string, default: "en"
  end
end
