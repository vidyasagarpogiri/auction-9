class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.integer :favorites
      t.integer :upvotes

      t.timestamps
    end
  end
end
