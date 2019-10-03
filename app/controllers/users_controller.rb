class UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users, include: [:challenges, :statistics]
    end
        
    def show 
        user = User.find_by(id: params[:id])
        render json: user.to_json, include: [:challenges, :statistics]
    end 
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def destroy 
        user= User.find_by(id: params[:id])
        user.delete
    end 

    private 

    
    def user_params 
        params.require(:user).permit(:username, :password, :name, :age, :avatar)
    end
    
end
