class UsersController < ApplicationController

    #log-in
    #register

    def index
        render json: User.all, except: [:created_at, :updated_at]
    end

    def show
        user = User.find(params[:id])
        render json: user, except: [:created_at, :updated_at]
    end

    private
    def user_params 
        params.require(:user).permit(:name, :password, :zipcode)
    end

end
