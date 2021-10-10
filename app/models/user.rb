class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bartered_items, dependent: :destroy
  has_many :bartered_item_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :wanted_items, dependent: :destroy
end
