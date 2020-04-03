class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_users, only: [:update, :destroy, :show, :updateYourself]
  before_action :authorize, only: [:updateYourself]
  before_action :authorize_as_admin, only: [:destroy, :getAllUsers, :createNewUser, :show, :update]


    def getAllUsers      
        users = User.select("userName", "email", "roll_id", "gender", "date_Of_Birth", "gender", "login")
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

    def createNewUser
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

    def updateYourself
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
     params.require(:user).permit(:userName, :email, :login, :password_digest, :password, :password_confirmation, :gender, :date_Of_Birth, :roll_id)

    end

    def authorize
      return head(:unauthorized) unless current_user && current_user.can_modify_user?(params[:id])
    end

end
