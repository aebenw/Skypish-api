class AuthController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        UserSerializer.new(@user)
      ).serializable_hash
      token = issue_token({jwt: @user.id})
        render json: {jwt: token, current_user: serialized_data}
    else
        render json: {error: "User is invalid"}, status: 401
    end
  end

  def show

    token = request.headers["Authorization"]
    decoded_token = decode(token)[0]["jwt"]
    user = User.find_by(id: decoded_token)

    if user
      render json: user
    else
      render json: {error: 'Invalid token'}, status: 401
    end

  end

end
