class Public::CommentsController < ApplicationController
  before_action :move_to_signed_in

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    #redirect_to post_path(post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ブックマークやコメントをしたい場合はログインが必要です！'
    end
  end

end
