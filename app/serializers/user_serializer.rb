class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :id, :inactive
  has_many :conversations



  def conversations
    Conversation.participating(object)
  end

  def inactive
    reg = object.incoming + object.outgoing
    dif = (User.all - [object]) - reg
    return dif
  end


end
