class FansController < ApplicationController

    get '/fans/login' do
       
    erb :'fans/login' 
    end

    get '/fans/new' do

    erb :'/fans/new'
    end

end
