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
  settings.print = settings.print + "<p ><span style='background-color:#{params['first']};margin-left:375px;'></span>
            <span style='background-color:#{params['second']};'></span>
            <span style='background-color:#{params['third']};'></span>
            <span style='background-color:#{params['fourth']};'></span></p>"

end

get '/' do
  @session = session
  settings.numerator+=1
  erb :index, :locals => {:choice => settings.print}
end

after '/' do


  halt 401, 'You\'ve won!' if @print == settings.game
  halt "You've lost!" if settings.numerator == 12
end
