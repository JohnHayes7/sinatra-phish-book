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
        binding.pry
    redirect :'/fans/:slug'
    end

end
