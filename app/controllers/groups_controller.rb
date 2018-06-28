class GroupsController < ApplicationController

    def index
        @groups=Group.all
    end

    def create
     # validation in Effect
     newGroup=Group.create(name:params["name"],description:params["description"],user:current_user)  #no userId, no removal request/function
     if newGroup.valid?
        Member.create(user_id:current_user.id,group_id:params[:id])
         return redirect_to '/groups'  #'users/show' 
     end 
     # Validation Errors
     redirect_to :back, alert: newGroup.errors.full_messages
    end

    def show
        @group=Group.find(params[:id])
        @members = @group.members
    end

    def destroy
        puts 'Destroy Method'
        dest = Group.find(params[:id]).destroy
        redirect_to '/groups'
    end
end
