class BarteredItemComment < ApplicationRecord
  belongs_to :user
  belongs_to :bartered_item
  
end
