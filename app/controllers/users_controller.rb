class UsersController < ApplicationController

    before_action :authorized, only:[:me]

    def create
        user = User.create(user_params)
        if user.valid?
            wristband = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), token: wristband}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def index
        users = User.all
        render json: users
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            wristband = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), token: wristband}
        else 
            render json: [error: "Incorrect username or password"]
        end 
    end

    def me
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
    end 

    private

    def user_params
        params.permit(:name, :username, :password, :quote)
    end

end

