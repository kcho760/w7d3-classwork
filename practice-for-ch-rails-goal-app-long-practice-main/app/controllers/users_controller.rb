class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            redirect_to user_url(id: params[:id])
        else
            flash.now[:errors] = User.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end