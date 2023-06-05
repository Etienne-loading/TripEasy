class Tag < ApplicationRecord
  belongs_to :step

  validates :name
end
