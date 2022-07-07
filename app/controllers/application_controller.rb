class ApplicationController < ActionController::Base
  #デバイスの（ユーザー登録やログインが使われる前に下記 configure_permitted_parametersメソッドが実行）
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email])
  end

end
