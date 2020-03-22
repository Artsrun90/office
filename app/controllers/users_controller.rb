class UsersController < ApplicationController
  before_action :authenticate_user,  only: [:index, :update, :show, :getAllUsers]
  before_action :set_users, only: [:update, :destroy, :show]
  before_action :authorize_as_admin, only: [:destroy, :getAllUsers]
  before_action :authorize, only: [:update]


    def getAllUsers      
        users = User.select("userName", "gender", "login", "email", "roll_id", "gender", "date_Of_Birth")
        render json: users, status: :ok
    end

    def index
      render json: current_user
    end

    def show
        # user = User.where(id: params[:id]).select("userName")
        render json: @user, status: :ok
    end 

    def create
        @user = User.new(set_params)    
        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end


    def update
        if @user.update(set_params)        
        render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
      if @user.destroy
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end

    end
  

    private
    
    def set_users
        @user = User.find(params[:id])
    end

    def set_params
     params.require(:user).permit(:userName, :login, :email, :password_digest, :password, :password_confirmation, :gender, :date_Of_Birth, :roll_id)

    end

    def authorize
      return head(:unauthorized) unless current_user && current_user.can_modify_user?(params[:id])
    end

end
