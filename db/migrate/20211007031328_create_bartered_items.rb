class CreateBarteredItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bartered_items do |t|
      
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :explanation, null: false
      t.integer :barter_way, null: false
      t.integer :desired_place, null: false
      t.integer :no1_wanted_item_id
      t.integer :no2_wanted_item_id
      t.integer :no3_wanted_item_id
      t.integer :barter_status, null: false, default: 0
      t.boolean :is_deleted, null: false, default: false
      
      t.timestamps
    end
  end
end
