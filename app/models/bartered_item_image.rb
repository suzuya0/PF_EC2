class BarteredItemImage < ApplicationRecord
  belongs_to :bartered_item
  attachment :image
end
