class Review < ApplicationRecord
  scope :today, lambda { where(created_on: Date.current) }
  scope :for, ->(date) { where(created_on: date) }

  belongs_to :user, counter_cache: true

  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
end
