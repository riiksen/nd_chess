class GameSupervisor
  @@games = [] of GameSupervisor

  @idle_time : Time?
  # The order of axes w - 4d, x, y, z - up/down
  @board = [] of Array(Array(Array(Symbol)))
  @players : NamedTuple(white: String, black: String)?
  @turn = :white

  def initialize(player1 : String, player2 : String)
    setup_board
    @players[:white] = player1
    @players[:black] = player2
  end

  def get_game_state
    {@board, @players, @turn}
  end

  def handle_action(action : String)

  end

  def handle_move()

  end

  def setup_4d_board
    # board = [] of Array(Array(Array(Symbol)))

    # w = 0
    @board[0][0][0][0] = :white_rook
    @board[0][1][0][0] = :white_knight
    @board[0][2][0][0] = :white_knight
    @board[0][3][0][0] = :white_rook
    @board[0][0][0][1] = :white_bishop
    @board[0][1][0][1] = :white_king
    @board[0][2][0][1] = :white_queen
    @board[0][3][0][1] = :white_bishop
    @board[0][0][0][2] = :white_bishop
    @board[0][1][0][2] = :white_queen
    @board[0][2][0][2] = :white_pawn
    @board[0][3][0][2] = :white_bishop
    @board[0][0][0][3] = :white_rook
    @board[0][1][0][3] = :white_knight
    @board[0][2][0][3] = :white_knight
    @board[0][3][0][3] = :white_rook

    4.times do |i|
      4.times do |j|
        @board[0][i][1][j] = :white_pawn
      end
    end

    # w = 1, there are only white pawns in this dimension
    4.times do |i|
      4.times do |j|
        @board[1][i][0][j] = :white_pawn
      end
    end

    # w = 2
    4.times do |i|
      4.times do |j|
        @board[2][i][3][j] = :black_pawn
      end
    end
    
    # w = 3
    @board[3][0][3][0] = :black_rook
    @board[3][1][3][0] = :black_knight
    @board[3][2][3][0] = :black_knight
    @board[3][3][3][0] = :black_rook
    @board[3][0][3][1] = :black_bishop
    @board[3][1][3][1] = :black_king
    @board[3][2][3][1] = :black_queen
    @board[3][3][3][1] = :black_bishop
    @board[3][0][3][2] = :black_bishop
    @board[3][1][3][2] = :black_queen
    @board[3][2][3][2] = :black_pawn
    @board[3][3][3][2] = :black_bishop
    @board[3][0][3][3] = :black_rook
    @board[3][1][3][3] = :black_knight
    @board[3][2][3][3] = :black_knight
    @board[3][3][3][3] = :black_rook

    4.times do |i|
      4.times do |j|
        @board[3][i][2][j] = :black_pawn
      end
    end

    # @board
    # board
  end

  def self.[](game_id : String)

  end

  def self.<<(game : GameSupervisor)
    @@games << game
  end
end
