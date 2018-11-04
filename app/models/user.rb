class User < ApplicationRecord
  # validates :email, presence: true
  # validates :password, length: { in: 6..20 }
  has_secure_password

  has_many :authored_conversations,  class_name:  "Conversation",
                                   foreign_key: "author_id",
                                   dependent:   :destroy
  has_many :received_conversations, class_name:  "Conversation",
                                   foreign_key: "receiver_id",
                                   dependent:   :destroy
  has_many :outgoing, through: :authored_conversations,  source: :receiver
  has_many :incoming, through: :received_conversations, source: :author


  has_many :messages


  def new_user
    reg = incoming + outgoing
    dif = (User.all - [self]) - reg
    return dif 
  end


end
