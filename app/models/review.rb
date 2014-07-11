class Review < ActiveRecord::Base
  # SCOPES
  scope :latest, -> { order('created_at DESC') }
  scope :with_content, -> { where.not(summary: nil, body: nil) }

  # VALIDATIONS
  validates :rating, presence: true,
    numericality: { only_integer: true, in: 0..5 }
end
