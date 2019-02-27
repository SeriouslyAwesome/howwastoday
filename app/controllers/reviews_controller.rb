class ReviewsController < ApplicationController
  after_action :set_user_time_zone, only: [:create, :update]

  def new
    @review = review_for_today
  end

  def create
    @review = current_user.reviews.create(review_params)
    render :thanks
  end

  def update
    @review = review_for_today
    @review.update(review_params)
    render :thanks
  end

  private

    def review_for_today
      current_user.reviews.for(Time.zone.now.utc.to_date).first_or_initialize
    end

    def review_params
      params.require(:review).permit(:rating, user_attributes: :time_zone)
    end

    def set_user_time_zone
      current_user.update(timezone: browser_time_zone.name)
    end
end
