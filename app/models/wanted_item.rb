class WantedItem < ApplicationRecord
  
  validates :title, presence: true
  validates :explanation, presence: true
  
  belongs_to :user
  has_many :wanted_item_images, dependent: :destroy
  accepts_attachments_for :wanted_item_images, attachment: :image
end
