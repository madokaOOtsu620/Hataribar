class Public::BookmarksController < ApplicationController
  before_action :move_to_signed_in

  def create
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: @post.id)
    bookmark.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    bookmark.destroy
    redirect_to post_path(@post)
  end

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    # 業界検索テンプレート用
    @industries = Industry.all
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ブックマークやコメントをしたい場合はログインが必要です！'
    end
  end

end
