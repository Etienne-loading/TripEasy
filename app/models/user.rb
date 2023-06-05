class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :blogs, dependent: :destroy
  # has_one_attached :profile_photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :pseudo, presence: true, uniqueness: true
  validates :interest, presence: true
  validates :nationality, presence: true
end
