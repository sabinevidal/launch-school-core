VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['hearts', 'diamonds', 'spades', 'clubs']
CHAMPION_SCORE = 2
CARD_WIN = 21
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def enter_to_continue
  puts 'Press enter to continue'
  $stdin.gets
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards[:cards].map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > CARD_WIN
  end

  sum
end

def busted?(cards)
  cards[:total] > CARD_WIN
end

def round_over(dealer, player)
  if someone_won?(dealer, player)
    winner = detect_winner(dealer, player)
    increment_winner(winner)
  end
  display_result(dealer, player)
  display_score(dealer, player, full: true)
  enter_to_continue
end

def detect_result(dealer, player)
  if player[:total] > CARD_WIN
    :player_busted
  elsif dealer[:total] > CARD_WIN
    :dealer_busted
  elsif player[:total] > dealer[:total]
    :player_won
  elsif dealer[:total] > player[:total]
    :dealer_won
  else
    :tie
  end
end

def display_result(dealer, player)
  result = detect_result(dealer, player)
  case result
  when :player_busted
    prompt "You're bust! Dealer wins this round!"
  when :dealer_busted
    prompt "Dealer bust! You win this round!"
  when :player_won
    prompt "You win this round!"
  when :dealer_won
    prompt "Dealer wins this round!"
  when :tie
    prompt "This round is a tie!"
  end
end

def display_score(dealer, player, full: false)
  puts "=============="
  prompt "Dealer has #{dealer[:cards]}, Total: #{dealer[:total]}" if full
  prompt "Dealer wins: #{dealer[:wins]}"
  prompt "Player has #{player[:cards]}, Total: #{player[:total]}" if full
  prompt "Player wins: #{player[:wins]}"
  puts "=============="
end

def detect_winner(dealer, player)
  result = detect_result(dealer, player)
  case result
  when :player_busted, :dealer_won
    dealer
  when :dealer_busted, :player_won
    player
  end
end

def someone_won?(dealer, player)
  !!detect_winner(dealer, player)
end

def increment_winner(winner)
  winner[:wins] += 1
end

def detect_champion(dealer, player)
  if player[:wins] == CHAMPION_SCORE
    player
  elsif dealer[:wins] == CHAMPION_SCORE
    dealer
  end
end

def declare_champion?(dealer, player)
  !!detect_champion(dealer, player)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def player_turn(deck, player)
  player_answer = nil
  loop do
    loop do
      puts "Would you like to (h)it or (s)tay?"
      player_answer = gets.chomp.downcase
      break if ['h', 's'].include?(player_answer)
      prompt "Sorry, please enter 'h' or 's'"
    end

    if player_answer == 'h'
      player[:cards] << deck.pop
      player[:total] = total(player)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player[:cards]}"
      prompt "Your total is now: #{player[:total]}"
    end
    break if player_answer == 's' || busted?(player)
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def dealer_turn(deck, dealer)
  prompt "Dealer's turn now..."
  loop do
    sleep(0.8)
    break if dealer[:total] >= DEALER_STAY
    prompt "Dealer hits!"
    dealer[:cards] << deck.pop
    dealer[:total] = total(dealer)
    prompt "Dealer's cards are now: #{dealer[:cards]} at #{dealer[:total]}"
  end
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = nil
  loop do
    answer = gets.chomp
    break if ['y', 'n'].include?(answer)
    prompt "Sorry, please enter 'y' or 'n'"
  end
  answer.downcase.start_with?('y')
end

player = {
  name: 'Player',
  cards: [],
  total: 0,
  wins: 0
}

dealer = {
  name: 'Dealer',
  cards: [],
  total: 0,
  wins: 0
}

# Game play

loop do
  system 'clear'
  prompt "Welcome to Twenty-One!"
  prompt "First to win #{CHAMPION_SCORE} rounds is the ultimate champion!"
  enter_to_continue
  player[:wins] = 0
  dealer[:wins] = 0

  loop do
    system 'clear'
    deck = initialize_deck
    player[:cards] = []
    dealer[:cards] = []
    player[:total] = 0
    dealer[:total] = 0

    # initial deal
    2.times do
      player[:cards] << deck.pop
      dealer[:cards] << deck.pop
    end

    player[:total] = total(player)
    dealer[:total] = total(dealer)

    prompt "Dealer has #{dealer[:cards][0]} and ?"
    prompt "You have #{player[:cards][0]} and #{player[:cards][1]}."
    prompt "Your total: #{player[:total]}."
    puts "------------------"

    player_turn(deck, player)
    player[:total] = total(player)
    if busted?(player)
      puts "------------------"
      round_over(dealer, player)
      declare_champion?(dealer, player) ? break : next
    else
      puts "You chose to stay at #{player[:total]}!"
      puts "------------------"
    end

    dealer_turn(deck, dealer)
    dealer[:total] = total(dealer)
    if busted?(dealer)
      prompt "Dealer total: #{dealer[:total]}"
      puts "------------------"
      round_over(dealer, player)
      declare_champion?(dealer, player) ? break : next
    else
      prompt "Dealer stays at #{dealer[:total]}"
      puts "------------------"
    end

    round_over(dealer, player)
    break if declare_champion?(dealer, player)
  end
  system 'clear'
  display_score(dealer, player)
  puts "*******************************************"
  puts "*******************************************"
  puts "The #{detect_champion(dealer, player)[:name]} is the Ultimate Champion!"
  puts "*******************************************"
  puts "*******************************************"

  play_again? ? next : break
end

prompt "Thanks for playing Twenty-one! Hope you had fun!"
