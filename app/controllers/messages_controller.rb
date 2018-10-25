class MessagesController < ApplicationController

  def index
    @messages = Message.all
    render json: @messages
  end

  def create

    if params.has_key?(:kind)

      message = Message.new(message_params)
      message.conversation_id = params[:conversation_id]
      # message = Message.new(kind: params[:kind], conversation_id: params[:conversationId], user_id: params[:user_id], from: params[:user_id], candidate: params[:candidate])
      if message.save
        # conversation = Conversation.find(params[:conversationId])
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)
        ).serializable_hash
        MessagesChannel.broadcast_to message.conversation, serialized_data
        head :ok
      else
        puts "error"
      end

    else
      message = Message.new(message_params)
      conversation = Conversation.find(params[:conversation_id])

      if message.save

        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)
        ).serializable_hash
        MessagesChannel.broadcast_to conversation, serialized_data
        head :ok
      end
    end
    if message.errors

    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :conversation_id, :user_id, :kind, :from, :to, :candidate)
  end
end
