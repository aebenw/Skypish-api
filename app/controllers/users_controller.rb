class UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users, status: 200
  end


  def show
    if User.find_by(name: params[:id].downcase)
      @user = User.find_by(name: params[:id].downcase)
    else
      @user = User.create(name: params[:id].downcase)
    end
    render json: @user, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :id)
  end
end
