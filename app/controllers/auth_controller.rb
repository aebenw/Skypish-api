class AuthController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) ## Authenticate is a part of has_secure_password
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
  decoded_token = decode(token)
  user = User.find(decoded_token[0]["jwt"])

  render json: user



  end

end
