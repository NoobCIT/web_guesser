require 'sinatra'
require 'sinatra/reloader'

number = rand(100 + 1)
get '/' do
  "The SECRET NUMBER is #{number}"
end
