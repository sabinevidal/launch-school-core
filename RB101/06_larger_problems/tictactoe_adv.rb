require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CHAMPION_SCORE = 5

# game setup
def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, user, computer)
  system 'clear'
  puts "You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'."
  puts "Score: Player - #{user[:wins]} Computer - #{computer[:wins]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def alternate_player(current_player, user, computer)
  current_player == user ? computer : user
end

# Game play logic

def play_game(user, computer)
  system 'clear'
  puts "Welcome to Tic Tac Toe!"
  puts "First to 5 wins!"
  puts "Let's see who will play first..."
  sleep(1)
  gameplay_loop(user, computer)
  puts "********************************"
  puts "********************************"
  puts "The #{detect_champion(user, computer)[:name]} is the Ultimate Champion!"
  puts "********************************"
  puts "********************************"
end

def choose_player(user, computer)
  [user, computer].sample
end

def gameplay_loop(user, computer)
  loop do
    system 'clear'
    board = initialize_board
    current_player = choose_player(user, computer)
    prompt "The #{current_player[:name]} will play first!"
    sleep(1)
    turn_loop(current_player, board, user, computer)
    round_over(board, user, computer)
    display_board(board, user, computer)
    break if declare_champion?(user, computer)
  end
end

def turn_loop(current_player, brd, user, computer)
  loop do
    display_board(brd, user, computer)
    place_piece!(current_player, brd, user, computer)
    current_player = alternate_player(current_player, user, computer)
    break if gameover?(brd, user, computer)
  end
end

def place_piece!(current_player, brd, user, computer)
  if current_player == user
    player_places_piece!(brd, user)
  elsif current_player == computer
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd, user)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = user[:token]
end

# Computer AI

# rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
def computer_places_piece!(brd)
  square = nil
  # Offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  # Defence
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  # pick middle square
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end
  # if no at risk square or middle, select a random one
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    # select the square that has an empty value
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def round_over(brd, user, computer)
  if someone_won?(brd, user, computer)
    winner = detect_winner(brd, user, computer)
    increment_winner(winner)
    display_board(brd, user, computer)
    puts "********************************"
    puts "#{winner[:name]} won this round!"
  else
    display_board(brd, user, computer)
    puts "********************************"
    puts "This round is a tie!"
  end
  puts "********************************"
  sleep(1)
end

# End game Logic

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, user, computer)
  !!detect_winner(brd, user, computer)
end

def detect_winner(brd, user, computer)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return user
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return computer
    end
  end
  nil
end

def increment_winner(winner)
  winner[:wins] += 1
end

def declare_champion?(user, computer)
  !!detect_champion(user, computer)
end

def detect_champion(user, computer)
  if user[:wins] == CHAMPION_SCORE
    user
  elsif computer[:wins] == CHAMPION_SCORE
    computer
  end
end

def gameover?(brd, user, computer)
  someone_won?(brd, user, computer) || board_full?(brd)
end

user = {
  name: 'Player',
  token: PLAYER_MARKER,
  wins: 0
}
computer = {
  name: 'Computer',
  token: COMPUTER_MARKER,
  wins: 0
}

# Game Play

loop do
  play_game(user, computer)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
