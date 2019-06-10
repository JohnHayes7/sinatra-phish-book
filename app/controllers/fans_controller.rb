class FansController < ApplicationController

    get '/fans/login' do
       
    erb :'fans/login' 
    end

    get '/fans/signup' do

    erb :'/fans/create'
    end

    get '/fans/:slug' do
        
    erb :'/fans/homepage'
    end

    post '/fans/signup' do
        @fan = Fan.find_by_username(params[:username])
        
        if @fan == nil
            @fan = Fan.create(:username => params[:username], :email => params[:email], :password => params[:password])
            binding.pry
        end
        
        
        
    redirect :'/fans/@fan.username.slug'
    end

end
