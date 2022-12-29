class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction 
      t.integer :price
      t.boolean :is_active, null: true

      t.timestamps
    end
  end
end
