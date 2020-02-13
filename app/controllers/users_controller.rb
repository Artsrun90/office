class UsersController < ApplicationController
    def getAllUsers
        users =User.select("id","userName")
        render json: users, status: :ok
    end
    def show
        user=User.where(id: params[:id]).select("userName")
        render json: user, status: :ok
    end 
end
