class Step < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :blog

  has_many :tags, dependent: :destroy
  has_many :tips, dependent: :destroy
  has_many_attached :photo


  # validates :title, presence: true
  # validates :address, presence: true
  # validates :content, presence: true
  # validates :duration, presence: true
end
