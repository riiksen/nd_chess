require "../../src/services/game_supervisor"
require "spec"


describe GameSupervisor do
  it "creates new game and pushes it to @@games" do
    player1 = "000000"
    player2 = "ffffff"

    game = GameSupervisor.new player1, player2
    GameSupervisor << game

    GameSupervisor.games[0].should be_a(GameSupervisor)
  end
end
