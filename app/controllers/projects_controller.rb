class ProjectsController < ApplicationController
     before_action :authenticate_user
     before_action :set_project, only: [:show, :update, :destroy]
     before_action :authorize_as_admin, only: [:index, :show, :create, :update, :destroy]

     def index
         @project = Project.all
         render json: @project, status: :ok
     end
 
     def show
         # user = User.where(id: params[:id]).select("userName")
         render json: @project, status: :ok
     end 
 
     def create
        project = Project.new(set_params)    
         if project.save
           render json: project, status: :created, location: project
         else
           render json: project.errors, status: :unprocessable_entity
         end
     end
 
 
     def update
         if @project.update(set_params)        
         render json: @project
         else
           render json: @project.errors, status: :unprocessable_entity
         end
     end
 
     def destroy
       if @project.destroy
         render json: @project
       else
         render json: @project.errors, status: :unprocessable_entity
       end
 
     end  
 
     private
     
     def set_project
         @project = Project.find(params[:id])
     end
 
     def set_params
      params.require(:project).permit(:name, :description, :userID)
     end
end
