eben = User.create(name: "eben", email: "eben@eben.com", password: "test")
juan = User.create(name: "juan", email: "juan@juan.com", password: "test")
jason = User.create(name: "jason",  email: "jason@juan.com", password: "test")
lindsay = User.create(name: "lindsay", email: "Lindsay@lindsay.com", password: "test")
peter = User.create(name: "peter", email: "Peter@peter.com", password: "test")


Conversation.create(author_id: eben.id, receiver_id: juan.id)
Conversation.create(author_id: peter.id, receiver_id: eben.id)
Conversation.create(author_id: juan.id, receiver_id: peter.id)
Conversation.create(author_id: lindsay.id, receiver_id: eben.id)
Conversation.create(author_id: peter.id, receiver_id: jason.id)


Message.create(user_id: 1, conversation_id: 1, text: "Hey Juan")
Message.create(user_id: 1, conversation_id: 1, text: "what's up?")
Message.create(user_id: 2, conversation_id: 1, text: "Not Much")
Message.create(user_id: 2, conversation_id: 1, text: "What's up with you?")
# Conversation.create(title: "what's up")
# Conversation.create(title: "good day")
#
# eben.active_relationships.create(received_id: juan.id)
nisha = User.create(name: "nisha", email: "nisha@nisha.com", password: "test")
joshua = User.create(name: "joshua", email: "joshua@joshua.com", password: "test")
gina = User.create(name: "gina", email: "gina@gina.com", password: "test")
blavin = User.create(name: "gavin", email: "blavin@blavin.com", password: "test")
