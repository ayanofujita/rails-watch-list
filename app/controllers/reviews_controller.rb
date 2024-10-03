class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    @bookmark = Bookmark.new
    if @review.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
