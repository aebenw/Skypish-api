class ConversationSerializer < ActiveModel::Serializer
  attributes :receiver, :author, :id, :messages
  has_many  :messages


  # def message_with_author
  #   object.messages.map {|mess| User.find(mess.user_id).name}
  #
  # end

end
