require 'sinatra'
require 'sinatra/reloader'

@win = false
@@guesses = 5
def guess_check(guess)
  if guess == 0 && @@guesses == 5
     "Try to guess the secret number (0 - 100)!"
  elsif guess - 4 > @@secret_number
    "Way too high! #{@@guesses} guesses left..."
  elsif guess + 4 < @@secret_number
    "Way too low! #{@@guesses} guesses left..."
  elsif guess > @@secret_number
    "Too high! #{@@guesses} guesses left..."
  elsif guess < @@secret_number
    "Too low! #{@@guesses} guesses left..."
  else
    @win = true
    "You got it right! Resetting..."
  end
end

def reset
  if @win == true || @@guesses == 0
    @@secret_number = rand(0..100)
    @@guesses = 5
  end
end

#guess_count
if @@guesses == 0
  reset
else
  @@guesses -= 1
end

def win_message
  if @win
    "The SECRET NUMBER is #{@@secret_number}"
  elsif @@guesses == 0
    "You are out of guesses! The SECRET NUMBER was #{@@secret_number}. Resetting number..."
  end
end

@@secret_number = rand(0..100)

get '/' do
  guess = params[:guess].to_i
  message = guess_check(guess)
  erb :index, :locals => {:number => @@secret_number, :message => message, :win_message => win_message, :guess_count => guess_count}
end
