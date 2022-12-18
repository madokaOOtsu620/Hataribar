class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user.id), notice: "ユーザーのステータスを変更しました！"
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:user_name, :email, :age, :is_deleted)
  end

end
