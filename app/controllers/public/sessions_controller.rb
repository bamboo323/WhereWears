# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64

      #ログイン時に名前を入力させる場合は下記記述が必要
      #user.last_name = "ゲスト"
      #user.first_name = "ユーザー"
    end
  sign_in user
  redirect_to root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end

  #退会しているか判断するメソッド
  def user_state
    #入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    #アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    #取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      redirect_to new_user_registration_path
    end
  end
end