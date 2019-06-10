require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  def logged_in?(session)
    !!session[:user_id]
  end

  def current_user(session)
    if session[:user_id] != nil
      @current_user = Fan.find(session[:user_id])
    end
  end

  get "/" do
    erb :welcome
  end

  get '/about' do
    erb :about
  end

end
