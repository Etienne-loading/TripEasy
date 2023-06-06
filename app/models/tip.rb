class Tip < ApplicationRecord
  belongs_to :step

  # validates :content, presence: true
  # validates :title, presence: true
  # validates :link
  # validates :category, presence: true
end
