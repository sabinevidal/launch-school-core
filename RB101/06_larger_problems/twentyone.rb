=begin

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end
require 'pry'

VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['hearts', 'diamonds', 'spades', 'clubs']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

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
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player_won
  elsif dealer_total > player_total
    :dealer_won
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted
    prompt "You're bust! Dealer wins!"
  when :dealer_busted
    prompt "Dealer bust! You win!"
  when :player_won
    prompt "You win!"
  when :dealer_won
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

# rubocop:disable Metrics/MethodLength
def player_turn(deck, player_cards)
  player_answer = nil
  loop do
    loop do
      puts "hit or stay? (h or s)"
      player_answer = gets.chomp.downcase
      break if ['h', 's'].include?(player_answer)
      prompt "Sorry, please enter 'h' or 's'"
    end

    if player_answer == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end
    break if player_answer == 's' || busted?(player_cards)
  end
end
# rubocop:enable Metrics/MethodLength

def dealer_turn(deck, dealer_cards)
  prompt "Dealer's turn now..."
  loop do
    break if total(dealer_cards) >= 17
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards} at #{total(dealer_cards)}"
  end
end

def play_again?
  puts "------------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# Game play

loop do
  system 'clear'
  prompt "Welcome to Twenty-One! Good luck!"

  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}"
  prompt "for a total of #{total(player_cards)}."
  puts "------------------"

  # player_turn
  player_turn(deck, player_cards)
  if busted?(player_cards)
    puts "------------------"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    puts "You chose to stay at #{total(player_cards)}!"
    puts "------------------"
  end

  # dealer_turn
  dealer_turn(deck, dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
  display_result(dealer_cards, player_cards)

  play_again? ? next : break
end

prompt "Thanks for playing Twenty-one! Hope you had fun!"
