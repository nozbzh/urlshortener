class AddSanitizedUrlColumnToUrls < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :sanitized_url, :string
  end
end
