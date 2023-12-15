class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  # def check_admin?
  #   unless current_user.admin?
  #     flash[:notice] = "you need admin`s user"
  #     redirect_to root_path
  #   end
  # end
  # def questions
  #   @questions = Question.all
  # helper_method :questions
  # helper_method :check_admin?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
  end

end