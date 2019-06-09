class FansController < ApplicationController

    get '/fans/login' do
       
       erb :'fans/login' 
    end

end
