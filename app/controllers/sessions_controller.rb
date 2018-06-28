class SessionsController < ApplicationController
# skip_before_action :require_login, except: [:destroy]

def index
end

def create # User Login Function
    @user = User.find_by(email: params[:email])
    errors = []
        if @user
            if @user.authenticate(params[:password]) # Successful Login
                session[:user_id] = @user.id
                return redirect_to '/groups' #'/users/show'  #'/secrets'
            else
                errors << 'Invalid password' # errors << is the same as errors.push
            end
        else
        errors << 'No account with that email exists. Please register first.'
        end
    redirect_to :back, alert: errors
    end

    def destroy # User Logout function
        session.delete :user_id if session.key? 'user_id'
        redirect_to '/sessions/index'   #'/users'
end

def new
    users = User.find_by(email: params[:email])
    
    if users && users.authenticate(params[:password])
        session[:id] = users.id
        render "/users"
        else 
            flash[:alert] = users.errors.full_messages
            puts flash[:alert]
            redirect_to "/users" #add flash message to display successfulregistration          
    end
end    
end

