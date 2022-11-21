class Public::PostsController < ApplicationController

  before_action :move_to_signed_in, except: [:index, :show]
  # before_action :post_params, expect: :new

  def index
    @user = current_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create

  end

  # def confirm
  #   @post = Post.new(@temporarily)
  #   if @post.invalid?
  #     render :new
  #   end
  # end

  # def back
  #   @post = Post.new(@temporarily)
  #   render :new
  # end

  # def complete
  #   Post.create!(@temporarily)
  # end

  #def create
    #post = Post.new(post_params)
    #post.save
    #redirect_to post_path(post.id)
  #end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to mypage_path
  end



  private

    #def post_params
      #params.require(:post).permit(:user_id, :industry_id, :answer_what, :answer_employment_type,
      #:answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      #:answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    #end

    def post_params
      params.require(:post).permit(:id, :user_id, :industry_id, :answer_what, :answer_employment_status,
      :answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      :answer_aptitude, :answer_future, :answer_advantage, :answer_free)
      # @temporarily = params.require('post').permit(:id, :user_id, :industry_id, :answer_what, :answer_employment_status,
      # :answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      # :answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    end

    def move_to_signed_in
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end



end
