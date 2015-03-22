require 'sinatra'
require 'sinatra/reloader'

@win = false
def guess_check(guess)
  if guess - 4 > SECRET_NUMBER
    "Way too high!"
  elsif guess + 4 < SECRET_NUMBER
    "Way too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    @win = true
    "You got it right!"
  end
end

def win_message
  if @win
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params[:guess].to_i
  message = guess_check(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :win_message => win_message}
end
