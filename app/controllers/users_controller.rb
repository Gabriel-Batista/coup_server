class UsersController < ApplicationController
    def index
    @users = User.all
    render json: @users
    end

    private

    def users_params()  
        params.require(:user).permit(:name)
    end
end

