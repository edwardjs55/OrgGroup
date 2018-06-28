class UsersController < ApplicationController
# skip_before_action :require_login, only: [:new, :create]

def create # New USER created/Register
    if new_user.valid?
      session[:user_id] = new_user.id
      return redirect_to '/groups'  #'users/show'    # '/secrets'
    end
    redirect_to :back, alert: new_user.errors.full_messages
  end

  def show
    # show the Users Song List
    # @name = User.find(params[:id]).fullName
    # @songs = PlayList.where(user:params[:id])
    #@songs = User.find(params[:id]).songs
  end

  def update
  end

  private
    helper_method def user
      @user ||= User.find_by(id: params[:id])
    end

    helper_method def new_user
      @new_user ||= User.create(user_params)
    end

    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password, :password_confirmation)
    end
end
