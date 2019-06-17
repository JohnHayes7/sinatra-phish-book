class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        @show = Show.find_by_slug(params[:date_slug])
        
        erb :'/shows/show'
    end

    
end