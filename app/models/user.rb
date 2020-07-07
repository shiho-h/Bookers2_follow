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

validates :name, presence: true,
  			length: { minimum: 2,maximum: 20 }
 validates :introduction, length: { maximum: 50 }
end
