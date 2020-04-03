class RollController < ApplicationController
    before_action :authenticate_user
    before_action :set_roll, only: [:show, :update, :destroy, :getRoleIdForAccount]
    before_action :authorize_as_admin, only: [:index, :show, :create, :update, :destroy]

    def index
        @roll = Roll.all
        render json: @roll, status: :ok
    end

    def show
        # user = User.where(id: params[:id]).select("userName")
        render json: @roll, status: :ok
    end 

    def getRoleIdForAccount
        render json: @roll, status: :ok
    end 

    def create
        roll = Roll.new(set_params)    
        if roll.save
          render json: roll, status: :created, location: roll
        else
          render json: roll.errors, status: :unprocessable_entity
        end
    end


    def update
        if @roll.update(set_params)        
        render json: @roll
        else
          render json: @roll.errors, status: :unprocessable_entity
        end
    end

    def destroy
      if @roll.destroy
        render json: @roll
      else
        render json: @roll.errors, status: :unprocessable_entity
      end

    end  

    private
    
    def set_roll
        @roll = Roll.find(params[:id])
    end

    def set_params
     params.require(:roll).permit(:rollName)
    end
end
