require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
  number = rand(0..100)
  "The secret number is #{number}"
end
