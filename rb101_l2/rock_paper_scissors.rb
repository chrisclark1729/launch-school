# frozen_string_literal: true

VALID_CHOICES = %w[rock paper scissors lizard spock]
shortcuts = {"r" => "rock", "p" => "paper", "s" => "scissors", "l" => "lizard", "k" => "spock"}

round_winner = ''
player_score = 0
computer_score = 0
ties = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
  (first == 'paper' && (second == 'rock' || second == 'spock')) ||
  (first == 'scissors' && (second == 'paper'|| second == 'lizard')) ||
  (first == 'lizard' && (second == 'spock'|| second == 'paper' )) ||
  (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def track_round_result(player, computer)
  if win?(player, computer)
    round_result = 'p'
  elsif win?(computer, player)
    round_result = 'c'
  else
    round_result = 't'
  end
end

def display_round_result(player, computer)
  if win?(player, computer)
    prompt('You won this round!')
  elsif win?(computer, player)
    prompt('Computer won this round!')
  else
    prompt('This round is a tie!')
  end
end

def display_game_status(player_score, computer_score, ties)
  if player_score == 3
    puts "Player won the game!"
  elsif computer_score == 3
    puts "Computer won the match!"
  else
    puts "Player: #{player_score} Computer: #{computer_score} Tie: #{ties}"
  end
end

loop do
    loop do
      choice = ''
      loop do
        prompt("Choose one: #{VALID_CHOICES.join(', ')}")
        choice = gets.chomp
        choice = shortcuts[choice] if choice.length == 1

        break if VALID_CHOICES.include?(choice)

        prompt("That's not a valid choice.")
      end

      computer_choice = VALID_CHOICES.sample

      prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

      display_round_result(choice, computer_choice)
      round_result = track_round_result(choice, computer_choice)
      if round_result == 'p'
        player_score = player_score.to_i + 1
      elsif round_result == 'c'
        computer_score = computer_score.to_i + 1
      else round_result == 't'
        ties = ties.to_i + 1
      end
      display_game_status(player_score, computer_score, ties)

      break if player_score == 3 || computer_score == 3
    end
  prompt('Do you want to play again?')
  player_score = 0
  computer_score = 0
  ties = 0
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing. Check you later.')
