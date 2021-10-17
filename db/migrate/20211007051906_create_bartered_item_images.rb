class CreateBarteredItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bartered_item_images do |t|
      
      t.integer :bartered_item_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
