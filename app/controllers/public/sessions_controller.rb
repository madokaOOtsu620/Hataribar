# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているかを判断するメソッド
  def user_state
    ## [処理1]入力されたemailからアカウントを1件取得
    @user = User.find_by(name: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## [処理2]取得したアカウントのパスワードと入力されたパスワードが一致しているかを判断する
    if @user.valid_password?(params[:user][:encrypted_password]) && (@user.is_deleted == false)
      flash[:notice] = "お探しのアカウントは退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_registration_path
    else
      flash[:notice] = "項目を入力してください。"
    ## [処理3]
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
