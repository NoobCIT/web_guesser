require 'sinatra'
require 'sinatra/reloader'
number = rand(101)
@@guesses = 5

#get block
get '/' do
  guess = params['guess']
  number_of_guesses = @@guesses
  message = check_guess(guess, number)
  number = new_number if @@guesses == 0
  erb :index, :locals => {:number => number, :message => message, :number_of_guesses => number_of_guesses}
end

def check_guess(guess, number)
  @@guesses -= 1
  if guess.to_i/5 > number
    "Way too high!"
  elsif guess.to_i < number/5
    "Way too low!"
  elsif guess.to_i > number
    "Too high!"
  elsif guess.to_i < number
    "Too low!"
  else
    reveal(number)
  end
end

def reveal(number)
  "You got that right, The SECRET NUMBER is #{number}"
end

def new_number
  rand(101)
  @@guesses = 5
end
