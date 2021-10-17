class WantedItemImage < ApplicationRecord
  belongs_to :wanted_item
  attachment :image
end
