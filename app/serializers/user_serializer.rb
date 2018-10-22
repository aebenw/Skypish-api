class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :id
  has_many :conversations


  def conversations
    Conversation.participating(object)
  end



end
