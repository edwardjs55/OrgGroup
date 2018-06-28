class MembersController < ApplicationController
    def join
        Member.create(user_id:current_user.id,group_id:params[:id])
        redirect_to :back
        
    end
    
    def unjoin
        rec = Member.where(user_id:current_user.id,group_id:params[:id])
        rec = rec[0]
        rec.destroy
        redirect_to :back

    end
end
