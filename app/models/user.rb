class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ } do
    validates :first_name
    validates :last_name
  end
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  # has_many :products
  # has_many :user_products
end
