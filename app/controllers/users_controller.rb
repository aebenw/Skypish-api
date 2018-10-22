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


  def followers
    @user = User.find_by(name:params[:currentU])
    @other = User.find_by(name:params[:otherU])
    @conversation = Conversation.new(author_id:@user.id,receiver_id:@other.id)

    if @conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(@conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end

    render json: @conversation
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :id)
  end
end
