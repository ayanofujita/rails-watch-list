class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.create(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    redirect_to list_path(@list) if @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
