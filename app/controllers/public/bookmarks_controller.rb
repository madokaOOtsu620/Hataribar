class Public::BookmarksController < ApplicationController
  before_action :move_to_signed_in

  def create
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
  end

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id).all.page(params[:page]).per(10)
    # 業界検索テンプレート用
    @industries = Industry.all
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ブックマークやコメントをしたい場合はログインが必要です！'
    end
  end

end
