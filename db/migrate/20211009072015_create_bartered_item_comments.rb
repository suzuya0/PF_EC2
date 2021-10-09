class CreateBarteredItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bartered_item_comments do |t|
      
      t.integer :bartered_item_id
      t.integer :user_id
      t.text :comment, null: false
      t.timestamps
    end
  end
end
