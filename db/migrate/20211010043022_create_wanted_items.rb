class CreateWantedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wanted_items do |t|
      
      t.integer :user_id
      t.string :title, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
