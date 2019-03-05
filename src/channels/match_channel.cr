class MatchChannel < Amber::WebSockets::Channel
  # message # => {"event" => "join", "topic" => "match:lobby"}
  def handle_joined(client_socket, message)
    if message["topic"] == "match:lobby"
      return :ok
    end

    topic = message["topic"]

    id = topic.split(':')[1]

    # Check id

  end

  # message # => {
  #  "event" => "message",
  #  "topic" => "match:lobby",
  #  "subject" => "message_new",
  #  "payload" => {
  #    "message" => "amber websockets is the bomb diggity!"
  #  }
  # }
  def handle_message(client_socket, message)
    GameSupervisor.get(message["topic"].split(':')[1]).handle(message["payload"])

    # case message["action"]
    # when "invite"
    # when "accept"
    # else
    # end
  end

  def handle_leave(client_socket)
    topics = client_socket.subscription_manager.subscriptions
    

    rebroadcast! {"event": "message", "topic": ""}
  end
end

