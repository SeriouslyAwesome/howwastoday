class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
