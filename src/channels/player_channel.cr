class PlayerChannel < Amber::WebSockets::Channel
  def  handle_joined(client_socket, message)
    if client_socket.session[:player_uid] != message["topic"].split(':')[1]
      client_socket.disconnect!
    end
  end

  def handle_message(client_socket, message)
    case message["subject"].split(':')[0]
    when "invite"
    when "accept"
    end
  end

  def handle_leave(client_socket)
  end
end
