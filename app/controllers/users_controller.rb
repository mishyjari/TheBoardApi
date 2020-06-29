class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      user_type: params[:userType]
    )
    render json: user
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      'User not found'
    end
  end

end
