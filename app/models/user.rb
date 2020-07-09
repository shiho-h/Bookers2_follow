class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#Bookアソシエーション
has_many :books
#favoriteアソシエーション
has_many :favorites, dependent: :destroy
#コメント機能
has_many :book_comments, dependent: :destroy
#プロフィール画像
attachment :profile_image

#フォロー機能ここから
has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

has_many :followings, through: :following_relationships

has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

has_many :followers, through: :follower_relationships

#ここまで
validates :name, presence: true,
  			length: { minimum: 2,maximum: 20 }
validates :introduction, length: { maximum: 50 }

#フォロー機能ここから
 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 has_many :followings, through: :following_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
#ここまで

end
