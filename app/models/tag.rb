class Tag < ApplicationRecord
  # TAG = ["biking", "hunting", "surfind"]
  belongs_to :step
  # validates :name, presence: true, inclusion: { in: TAG }
  # validates :name
end
