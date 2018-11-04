class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :id, :inactive
  has_many :conversations



  def conversations
    Conversation.participating(object)
  end

  def inactive
    reg = incoming + outgoing
    dif = (User.all - [self]) - reg
    return dif
  end


end
