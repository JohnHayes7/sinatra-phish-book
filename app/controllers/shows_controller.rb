class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        @show = Show.find_by_slug(params[:date_slug])
        @current_user = current_user(session)
        # binding.pry
        erb :'/shows/show'
    end

    
end