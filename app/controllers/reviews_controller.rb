class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    list = List.find(params[:list_id])
    review.list = list
    redirect_to list_path(list) if review.save
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
