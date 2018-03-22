require 'sinatra'
require 'sinatra/reloader' # stavi posli ono if_development?
get '/' do
  erb :index
end
