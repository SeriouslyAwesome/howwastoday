class Review < ActiveRecord::Base
  scope :latest, -> { order('created_at DESC') }
  scope :with_content, -> { where.not(summary: nil, body: nil) }

  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }
end
