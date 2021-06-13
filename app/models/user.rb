class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :password, length: { minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, format: { with: /\A[a-z0-9]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  has_many :products
  has_many :user_products
end
