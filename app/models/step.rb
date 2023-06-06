class Step < ApplicationRecord
  belongs_to :blog

  has_many :tags, dependent: :destroy
  has_many :tips, dependent: :destroy
  has_many_attached :photo

  validates :title, presence: true
  validates :city, presence: true
  validates :content, presence: true
  validates :duration, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :country, presence: true
end
