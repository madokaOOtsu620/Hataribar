class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def confirm
  end


  private

    def post_params
      params.require(:post).permit(:user_id, :industry_id, :answer_what, :answer_employment_type,
      :answer_working_style, :answer_income, :answer_how, :answer_skill, :answer_why,
      :answer_aptitude, :answer_future, :answer_advantage, :answer_free)
    end

end
