class CreateWantedItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :wanted_item_images do |t|
      
      t.integer :wanted_item_id, null: false
      t.string :image_id
      
      t.timestamps
    end
  end
end
