class FansController < ApplicationController

    get '/fans/login' do
       
    erb :'fans/login' 
    end


    get '/fans/signup' do

    erb :'/fans/create'
    end


    get '/fans/:slug' do
        redirect_if_not_logged_in
            
        erb :'/fans/homepage'
    end


    post '/fans/signup' do
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @fan = Fan.find_by_username(params[:username])
            if @fan == nil
                @fan = Fan.create(:username => params[:username], :email => params[:email], :password => params[:password])
                session[:user_id] = @fan.id
                redirect :"/fans/#{@fan.slug}"
            else
                redirect :'fans/login'
            end
        else
            flash[:empty_field] = "You Must Fill Out All Fields To Create A Profile"
            redirect "/fans/signup"
        end
    end


    post '/fans/login' do
        
        @fan = Fan.find_by_username(params[:username])
        if @fan && @fan.authenticate(params[:password])
            session[:user_id] = @fan.id
            
            redirect "/fans/#{@fan.slug}"   
        else
            flash[:login_error] = "Invalid username or password. Please try again or create an account."
            redirect '/fans/login'
        end
    end


    post '/fans/logout' do 
        session.clear

    redirect '/'
    end

    

end
