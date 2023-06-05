class Blog < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :steps, dependent: :destroy
  # has_one_attached :profile_photo

  validates :title, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
