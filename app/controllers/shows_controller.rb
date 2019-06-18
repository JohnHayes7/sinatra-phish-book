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
    
        @show.fan_id = @fan.id
        @show.fans << Fan.find_by_id("#{@fan.id}")
        @show.save
        
        redirect "/shows/#{params[:slug]}"
        
    end
    
end