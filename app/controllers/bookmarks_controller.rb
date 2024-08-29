class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    params[:bookmark][:movie_id].each do |movie_id|
      @bookmark = Bookmark.new
      @bookmark.comment = params[:bookmark][:comment]
      @bookmark.movie_id = movie_id
      @bookmark.list = List.find(params[:list_id])
      @bookmark.save
    end
    redirect_to list_path(@bookmark.list)
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
