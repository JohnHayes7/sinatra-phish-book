class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        @show = Show.find_by_slug(params[:date_slug])
        @current_user = current_user(session)
        # binding.pry
        erb :'/shows/show'
    end

    get '/shows/:slug/add_show' do
        @fan = current_user(session)
        @show = Show.find_by_slug(params[:slug])
        binding.pry
        @show.fan_ids << @fan.id
        
        @show.save
        
        redirect "/shows/#{params[:slug]}"
        
    end
    
end