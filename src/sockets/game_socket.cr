struct GameSocket < Amber::WebSockets::ClientSocket
  channel "player:*", PlayerChannel
  channel "match:*", MatchChannel
  channel "match:lobby", LobbyChannel

  def on_connect
    # do some authentication here
    # return true or false, if false the socket will be closed
    true
  end
end
