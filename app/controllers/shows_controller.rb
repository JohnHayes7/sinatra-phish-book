class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        @show = Show.find_by_slug(params[:date_slug])
        @fan = current_user(session)
        # binding.pry
        erb :'/shows/show'
    end

    get '/shows/:slug/add_show' do
        @fan = current_user(session)
        @show = Show.find_by_slug(params[:slug])
        if !@fan.shows.include?(@show)
            @fan.add_show(@show)
            flash[:show_added]= "Show successfully added to your shows"
            redirect "/shows/#{params[:slug]}"
        else
            flash[:show_not_added]="This show is already added to your shows"
            redirect "/shows/#{params[:slug]}"
        end
    end

    get '/shows/:slug/remove' do 
        @fan = current_user(session)
        @show = Show.find_by_slug(params[:slug])
        @fan.shows.delete(@show)

        redirect "/fans/#{@fan.slug}"
    end
    
end