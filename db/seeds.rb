eben = User.create(name: "eben", email: "eben@eben.com")
juan = User.create(name: "juan", email: "juan@juan.com")
jason = User.create(name: "jason",  email: "jason@juan.com")
lindsay = User.create(name: "lindsay", email: "Lindsay@lindsay.com")
peter = User.create(name: "peter", email: "Peter@peter.com")


Conversation.create(author_id: eben.id, receiver_id: juan.id)
Conversation.create(author_id: peter.id, receiver_id: eben.id)
Conversation.create(author_id: juan.id, receiver_id: peter.id)
Conversation.create(author_id: lindsay.id, receiver_id: eben.id)
Conversation.create(author_id: peter.id, receiver_id: jason.id)



Message.create(user_id: 1, conversation_id: 1, text: "what's up?")
Message.create(user_id: 2, conversation_id: 1, text: "Not Much")
Message.create(user_id: 1, conversation_id: 1, text: "Hello")
Message.create(user_id: 2, conversation_id: 1, text: "Cool")
# Conversation.create(title: "what's up")
# Conversation.create(title: "good day")
#
# eben.active_relationships.create(received_id: juan.id)
