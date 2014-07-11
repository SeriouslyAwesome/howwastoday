class ReviewsController < ApplicationController
  respond_to :json
  
  def index
    @reviews = Review.latest.limit(10)
    respond_with @reviews, status: 200
  end

  def create
    @review = Review.create(review_params)
    respond_with @review, status: 200
  end

  private

  def review_params
    params.require(:review).permit(:rating, :summary, :name, :body)
  end
end
