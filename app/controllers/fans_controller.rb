class FansController < ApplicationController

    get '/fans/login' do
       
    erb :'fans/login' 
    end

    get '/fans/signup' do

    erb :'/fans/create'
    end

    get '/fans/:slug' do
        if logged_in?(session)
       @fan = Fan.find_by_slug(params[:slug])
        end
        
    erb :'/fans/homepage'
    end

    post '/fans/signup' do
        @fan = Fan.find_by_username(params[:username])
        if @fan == nil
            @fan = Fan.create(:username => params[:username], :email => params[:email], :password => params[:password])
            session[:user_id] = @fan.id
            redirect :"/fans/#{@fan.slug}"
        else
            redirect :'fans/signup'
        end
    end

    post '/fans/login' do
       @fan = Fan.find_by_username(params[:username])
       
       if @fan && @fan.authenticate(params[:password])
        session[:id] = @fan.id
        redirect "/fans/#{@fan.slug}"
       else
        redirect '/fans/login'
       end
    end

    post '/fans/logout' do 
        session.clear

    erb :welcome
    end

end
