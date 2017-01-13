class AddColumnsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :business_name, :string
    add_column :items, :contact_name, :string
    add_column :items, :address, :string
    add_column :items, :city, :string
    add_column :items, :state, :string
    add_column :items, :zip, :string
    add_column :items, :phone, :string
    add_column :items, :email, :string
    add_column :items, :retail_value, :integer
    add_column :items, :delivery, :boolean
  end
end
