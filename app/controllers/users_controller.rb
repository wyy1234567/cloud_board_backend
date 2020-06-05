class UsersController < ApplicationController

    skip_before_action :authorized, except: :ping
    #register
    #login
    #logout

    def index
        render json: User.all, except: [:created_at, :updated_at]
    end

    def register 
        user = User.create(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: { id: user.id, name: user.name, zipcode: user.zipcode, jwt: token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(name: user_params[:name])
        if user && user.authenticate(user_params[:password])
            # encode token comes from ApplicationController
            token = encode_token({ user_id: user.id })
            render json: { id: user.id, name: user.name, zipcode: user.zipcode, jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    def logout
    end

    def ping
        render json: {success: true}
    end

    private
    def user_params 
        params.require(:user).permit(:name, :password, :zipcode)
    end

end
