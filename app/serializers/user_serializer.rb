class UserSerializer < ActiveModel::Serializer
  attributes :email
  # has_many :conversations
end
