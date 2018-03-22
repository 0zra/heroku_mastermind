require_relative 'generator'
require 'sinatra'
require 'sinatra/reloader' # stavi posli ono if_development?

configure do
  enable :sessions
  set :session_secret, "secret"
end


set :game, Library.generate_code
set :numerator, 0
set :print, ""
before do


end

get '/' do
  @session = session
  settings.numerator+=1
  erb :index, :locals => {:choice => settings.print}
end

after '/' do
  settings.print = []
  settings.print << params['first']
  settings.print << params['second']
  settings.print << params['third']
  settings.print << params['fourth']
  halt 401, 'You\'ve won!' if @print == settings.game
  halt "You've lost!" if settings.numerator == 12
end
