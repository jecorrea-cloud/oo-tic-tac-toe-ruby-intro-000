class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board(board=@board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(board = @board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board = @board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn_count(board=@board)
    counter = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
        counter +=1
      end
    end
    counter
  end

  def current_player(board=@board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def turn(board=@board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def won?(board=@board)
    WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

       if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
         return win_combination
       end
    end
    return false
  end

end
