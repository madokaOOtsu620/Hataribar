class Public::BookmarksController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: post.id)
    bookmark.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: post.id)
    bookmark.destroy
    redirect_to post_path(post)
  end

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

end
