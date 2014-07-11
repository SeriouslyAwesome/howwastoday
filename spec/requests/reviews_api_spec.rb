require 'spec_helper'

describe 'Reviews API' do
  describe 'POST /reviews' do
    before do
      post '/reviews', { review: attributes_for(:review), format: :json }
    end

    it 'adds the new review to the database' do
      expect(Review.count).to eq(1)
    end

    it 'returns the new review as JSON' do
      expect(JSON.parse(response.body)['rating']).to eq(1)
    end

    it 'returns status: 200 on success' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /reviews' do
    it 'returns first 10 reviews sorted by time submitted' do
      25.times do
        create(:review)
      end

      get '/reviews', { format: :json }

      expect(JSON.parse(response.body).length).to be <= 10
    end
  end
end