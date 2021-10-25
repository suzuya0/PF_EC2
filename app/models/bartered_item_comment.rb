class BarteredItemComment < ApplicationRecord
  
  validates :comment, presence: true
  
  belongs_to :user
  belongs_to :bartered_item
  
end
