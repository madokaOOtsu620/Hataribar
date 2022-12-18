class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  # この場合のindexは、ユーザーが自分の投稿を見る時に使用。
  # 検索結果一覧や、業界からの検索結果一覧は別ビューを用意。
  def index
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(10)
    # 業界検索テンプレート用
    @industries = Industry.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # 業界検索テンプレート用
    @industries = Industry.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "体験談を投稿しました！"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post), notice: "内容を更新しました！"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to mypage_path, notice: "投稿を削除しました！"
  end

  private

    def post_params
      params.require(:post).permit(:industry_id, :answer_what, :answer_employment_status,
      :answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      :answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    end

end
