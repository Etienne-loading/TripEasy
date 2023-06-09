class Blog < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :title ],
    associated_against: {
      steps: [:title, :content, :country],
      tags: [:name],
      tips: [:content, :title, :category],
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  acts_as_taggable_on :tags
  has_many :likes, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :tips, through: :steps
  has_many :tags, through: :steps
  has_one_attached :photo_banner
  has_one_attached :photo_card
  has_one_attached :video#, amazon: :s3

  validates :title, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  def previous_step(step)
    self.steps.order(:id).select{|steppy| steppy.id < step.id}.last
  end
end
