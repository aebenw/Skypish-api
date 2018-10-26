class MessageSerializer < ActiveModel::Serializer
  attributes :conversation_id, :text, :created_at, :author_name

  def author_name
    User.find(object.user_id).name
  end
end
