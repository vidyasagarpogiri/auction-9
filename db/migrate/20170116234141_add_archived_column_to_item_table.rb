class AddArchivedColumnToItemTable < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :archived, :boolean, default: false
  end
end
