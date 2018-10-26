class VideoSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :kind, :to, :from, :sdp, :candidate
end
