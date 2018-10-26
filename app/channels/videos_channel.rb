class VideosChannel < ApplicationCable::Channel
  def subscribed
   conversation = Conversation.find(params[:conversation])
   binding.pry
   stream_for conversation
 end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
