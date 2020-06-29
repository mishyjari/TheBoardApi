class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:usernameOrEmail])

    if user.authenticate(params[:password])
      render json: user
    else
      puts user
    end
  end

  def destroy
    session = session.destroy
    render json: session
  end
end
