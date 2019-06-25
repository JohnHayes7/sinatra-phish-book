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

  def redirect_if_not_logged_in
    if !logged_in?(session)
      flash[:must_login] = "You must be logged in to add a memory"
      redirect "/fans/login"
    end
  end

  get "/" do
    if logged_in?(session)
      @fan = Fan.find_by(:id => session[:user_id])
      redirect "/fans/#{@fan.slug}"
    else
    erb :welcome
    end
  end

  get '/about' do
    erb :about
  end

end
