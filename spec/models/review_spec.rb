require 'rails_helper'

RSpec.describe Review, :type => :model do
  it 'requires a rating' do
    expect(build(:review, rating: nil)).to be_invalid
    expect(build(:review, rating: '')).to be_invalid
  end

  it 'requires that rating be an integer between 0 and 5' do
    expect(build(:review, rating: '')).to be_invalid
    expect(build(:review, rating: Time.now)).to be_invalid
    expect(build(:review, rating: 2.56)).to be_invalid
  end

  it 'does not require a summary' do
    expect(build(:review, summary: nil)).to be_valid
    expect(build(:review, summary: '')).to be_valid
  end

  it 'does not require a body' do
    expect(build(:review, body: nil)).to be_valid
    expect(build(:review, body: '')).to be_valid
  end

  it 'responds to .with_content' do
    21.times do
     create(:empty_review)
    end
    5.times{ create(:review) }

    expect(Review.with_content.size).to eq(5)
  end
end
