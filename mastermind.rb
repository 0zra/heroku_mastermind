require_relative 'generator'
require_relative 'controler'
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
  @helper = []
  @helper <<params['first']
  @helper <<params['second']
  @helper <<params['third']
  @helper <<params['fourth']
  h1 = Controler.num_of_same_colors(@helper,settings.game)
  h2 = Controler.num_of_hits(@helper,settings.game)

  settings.print = settings.print + "<p ><span style='background-color:#{params['first']};margin-left:375px;'></span>
            <span style='background-color:#{params['second']};'></span>
            <span style='background-color:#{params['third']};'></span>
            <span style='background-color:#{params['fourth']};'></span>
              Colors quessed:#{h1} , Hits:#{h2}</p> <br>"
  @session = session
  settings.numerator+=1
  erb :index, :locals => {:choice => settings.print}

end

after '/' do

  halt 401, 'You\'ve won!' if @helper == settings.game
  halt "You've lost!" if settings.numerator == 12
end
