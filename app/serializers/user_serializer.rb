class UserSerializer < ActiveModel::Serializer
  attributes :email, :name
  has_many :conversations

  def conversations
    Conversation.participating(object)
  end

end
