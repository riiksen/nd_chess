class MatchChannel < Amber::WebSockets::Channel
  # message # => {"event" => "join", "topic" => "match:lobby"}
  def handle_joined(client_socket, message)
    id = message["topic"].split(':')[1]

    client_socket.disconnect! unless id == session[:player_uid]
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
    action = message["subject"].split(':')

    case action[0]
    when "invite"
    when "accept"
    when "match"
    end

    # case message["action"]
    # when "invite"
    # when "accept"
    # else
    # end
  end

  def handle_leave(client_socket)
    topics = client_socket.subscription_manager.subscriptions
    

    # rebroadcast! {"event" => "message", "topic" => ""}
  end
end

