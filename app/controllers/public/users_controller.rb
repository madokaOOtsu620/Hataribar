class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      @user = current_user
      render :edit
    end
  end

  # 退会機能
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def confirm
  end



  # before_action user_admin, only: [:index]
  # # admin権限持ちユーザーのみ閲覧可能

  # def index
  #   @users = User.all
  # end

  # user_adminを定義
  # ログイン中のユーザーのadminカラムがfalseならトップページへ
  # trueならユーザー一覧ページへ
  private

    # def user_admin
    #   @users = User.all
    #   if  current_user.admin == false
    #       redirect_to root_path
    #   else
    #       render action: "index"
    #   end
    # end

    def user_params
      params.require(:user).permit(:user_id, :email, :encrypted_password, :age, :is_deleted)
    end

end
