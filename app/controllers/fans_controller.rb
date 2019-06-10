class FansController < ApplicationController

    get '/fans/login' do
       
    erb :'fans/login' 
    end

    get '/fans/signup' do

    erb :'/fans/create'
    end

    post '/fans/signup' do
        binding.pry
    end

end
