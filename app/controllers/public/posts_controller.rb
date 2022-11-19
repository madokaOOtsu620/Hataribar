class Public::PostsController < ApplicationController

  before_action :move_to_signed_in
  before_action :permit_params, expect: :new

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(@temporarily)
    if @post.invalid?
      render :new
    end
  end

  def back
    @post = Post.new(@temporarily)
    render :new
  end

  def complete
    Post.create!(@temporarily)
  end

  #def create
    #post = Post.new(post_params)
    #post.save
    #redirect_to post_path(post.id)
  #end


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end



  private

    #def post_params
      #params.require(:post).permit(:user_id, :industry_id, :answer_what, :answer_employment_type,
      #:answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      #:answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    #end

    def permit_params
      @temporarily = params.require('post').permit(:user_id, :industry_id, :answer_what, :answer_employment_type,
      :answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      :answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    end

    def move_to_signed_in
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end



end
