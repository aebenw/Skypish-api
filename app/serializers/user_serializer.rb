class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :id
  has_many :conversations
  has_many :inactive


  def conversations
    Conversation.participating(object)
  end

  def inactive
    reg = incoming + outgoing
    dif = (User.all - [self]) - reg
    return dif
  end


end
