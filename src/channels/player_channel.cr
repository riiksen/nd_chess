class PlayerChannel < Amber::WebSockets::Channel
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
    # GameSupervisor.get(message["topic"].split(':')[1]).handle(message["payload"])
    action = message["subject"].split(':')

    case action[0]
    when "invite"
      InviteSupervisor.push from: session[:player_uid], to: action[1]
      rebroadcast({
        "event": "message",
        "topic": "player:#{action[1]}",
        "subject": "invite_from:#{session[:player_uid]}",
        "payload": {
          "error": "unrecognized action"
        }
      })

    when "accept"
      invite = InviteSupervisor.have_correct_invite_from(from: action[1], to: session[:player_uid])
      unless invite
        rebroadcast({
          "event": "message",
          "topic": message["topic"],
          "subject": "accept:return",
          "payload": {
            "error": "you try to accept invalid or expired invite"
          }
        })
      end

      rebroadcast({
        "event": "message",
        "topic": message["topic"],
        "subject": "action:return",
        "payload": {
          "error": "unrecognized action"
        }
      })

      rebroadcast({
        "event": "message",
        "topic": message["topic"],
        "subject": "action:return",
        "payload": {
          "error": "unrecognized action"
        }
      })
    else
      rebroadcast!({
        "event": "message",
        "topic": message["topic"],
        "subject": "action:return",
        "payload": {
          "error": "unrecognized action"
        }
      })
    end
  end

  def handle_leave(client_socket)
  end
end

