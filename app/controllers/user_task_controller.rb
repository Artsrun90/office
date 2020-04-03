class UserTaskController < ApplicationController
    before_action :authenticate_user
    before_action :find_users, only: [:getTasks]
    before_action :set_users, only: [:destroyUserTask]
    before_action :authorize_as_admin, only: [:GetAllUserTasks, :getTasks, :destroyUserTask, :userTaskCreate]

    def GetAllUserTasks 
        ustask= UserTask.joins(:user).joins(:task).select('id', 'userName','taskName').order("userName")
        render json: ustask
    end    
    
    
    def getTasks  
        user = User.find_by_userName(params[:userName])
        if user
        ustask = UserTask.joins(:task).select('taskName', "taskDescription").where(user_id: user.id).order("taskName")
        render json: ustask, status: :ok
        else
            render status: :not_found
        end
    end

    def destroyUserTask
        if @UserTask.destroy
          render json: @UserTask
        else
          render json: @UserTask.errors, status: :unprocessable_entity
        end
  
    end 

    def create
        usertask = UserTask.new(set_params)    
        if usertask.save
          render json: usertask, status: :created, location: usertask
        else
          render json: usertask.errors, status: :unprocessable_entity
        end
    end


    private
    
    def find_users
        @user = User.find_by_userName(params[:userName])
    end

    def set_users
        @UserTask = UserTask.find(params[:id])
    end

    def set_params
        params.require(:user_task).permit(:user_id, :task_id)   
    end


end
