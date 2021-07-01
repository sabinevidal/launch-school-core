VALID_CHOICES_HASH = { rock: "r",
                       paper: "p",
                       scissors: "sc",
                       lizard: "l",
                       spock: "sp" }

# key can defeat its values
CONDITIONS = { rock: ["scissors", "lizard"],
               paper: ["rock", "spock"],
               scissors: ["paper", "lizard"],
               lizard: ["spock", "paper"],
               spock: ["rock", "scissors"] }

scores = { user: 0,
           computer: 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  CONDITIONS[first].include?(second.to_s)
end

def determine_winner(user, computer)
  if win?(user, computer)
    'user'
  elsif win?(computer, user)
    'computer'
  end
end

def display_results(winner)
  case winner
  when 'user'     then prompt("You won the round!")
  when 'computer' then prompt("Computer won the round!")
  else                 prompt("This round is a tie!")
  end
end

def update_scores(winner, scores)
  case winner
  when 'user' then scores[:user] += 1
  when 'computer' then scores[:computer] += 1
  end
end

def display_scores(scores)
  scores = <<-MSG

      -----------------------------
      Your points: #{scores[:user]}
      Computer's points: #{scores[:computer]}
      -----------------------------

  MSG
  prompt(scores)
end

def reset_scores(scores)
  scores.keys.each do |player|
    scores[player] = 0
  end
end

# begin game
system('clear')
prompt("Welcome to Rock Paper Scissors Lizard Spock!")
prompt("Winner is the first player to get to 3!")

loop do
  choice = ''
  loop do
    prompt("Choose one: ")
    VALID_CHOICES_HASH.each do |name, option|
      prompt("For #{name}, enter #{option}")
    end

    choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES_HASH.values.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  user_choice = VALID_CHOICES_HASH.key(choice)
  computer_choice = VALID_CHOICES_HASH.keys.sample()

  prompt("You chose: #{user_choice}; Computer chose: #{computer_choice}")

  prompt("-------------------------")
  winner = determine_winner(user_choice, computer_choice)
  display_results(winner)
  update_scores(winner, scores)
  display_scores(scores)

  scores.each do |player, score|
    if score == 3
      announce_winner = <<-MSG
      "The game is over!"
      -----------------------------
      ** The #{player} is the champion! **
      -----------------------------
      MSG
      prompt(announce_winner)
      reset_scores(scores)
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, goodbye!")
