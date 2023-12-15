class UsersController < ApplicationController
  before_action :check_admin?
  def index
    @users = User.all
  end
    def check_admin?
      unless current_user.admin?
        flash[:notice] = "you need admin`s user"
        redirect_to root_path
      end
    end
end
