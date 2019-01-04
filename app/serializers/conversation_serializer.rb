class ConversationSerializer < ActiveModel::Serializer
  attributes :receiver, :author, :id, :messages
  has_many  :messages


  def messages
    object.messages.map {|mess| ShallowMessageSerializer.new(mess)}
  
  end

end
