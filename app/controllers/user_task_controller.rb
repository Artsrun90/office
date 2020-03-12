class UserTaskController < ApplicationController
    before_action :set_users, only: [:getTasks]

    def GetAllUserTasks 
        ustask= UserTask.joins(:user).joins(:task).select('userName','taskName')
        render json: ustask
    end    
    
    
    def getTasks 
        ustask= UserTask.joins(:task).select('taskName').where(user_id: @user.id)
        render json: ustask
    end


    private
    
    def set_users
        @user = User.find(params[:id])
    end

    def set_params
     params.require(:user).permit(:userName, :login, :email, :password_digest, :password, :password_confirmation, :gender, :date_Of_Birth, :roll_id)

    end

end
