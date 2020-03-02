class TasksController < ApplicationController
    # before_action :authorize_as_admin, only: [:index, :show, :create, :update, :destroy]
    before_action :set_tasks, only: [:show, :update, :destroy]

    def index
        @tasks = Task.all
        render json: @tasks, status: :ok
    end

    def show
        # user = User.where(id: params[:id]).select("userName")
        render json: @task, status: :ok
    end 

    def create
        task = Task.new(set_params)    
        if task.save
          render json: task, status: :created, location: task
        else
          render json: task.errors, status: :unprocessable_entity
        end
    end


    def update
        if @task.update(set_params)        
        render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
    end

    def destroy
      if @task.destroy
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end

    end  

    private
    
    def set_tasks
        @task = Task.find(params[:id])
    end

    def set_params
     params.require(:task).permit(:taskName, :taskDescription, :project_id)
    end

end
