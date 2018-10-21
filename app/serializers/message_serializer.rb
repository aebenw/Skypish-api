class MessageSerializer < ActiveModel::Serializer
  attributes :conversation_id, :text, :created_at
end
