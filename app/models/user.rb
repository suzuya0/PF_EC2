class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :image
  
  has_many :bartered_items, dependent: :destroy
  has_many :bartered_item_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :wanted_items, dependent: :destroy
  
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers,  through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
 #参考URLhttps://qiita.com/yuto_1014/items/358d0a425193b12c969a
  
  enum barter_way:{郵送のみ:0,手渡しのみ:1,郵送・手渡し両方可:2}
  enum desired_place:{
     郵送:0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
     沖縄県:47
     }
  enum barter_status:{募集中:0, 取引終了:1}
  
end