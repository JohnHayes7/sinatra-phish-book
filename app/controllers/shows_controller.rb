class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        if logged_in?(session)
        @show = Show.find_by_slug(params[:date_slug])
        @fan = current_user(session)
        # binding.pry
        erb :'/shows/show'
        else
            flash[:must_login] = "YOU MUST LOGIN TO CONTINUE"
            redirect :'/fans/login'
        end
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
        if @fan.shows.include?(@show)
            @fan.shows.delete(@show)
            redirect "/fans/#{@fan.slug}"
        else
            flash[:remove_error] = "This show is not in your collection of shows"
            redirect "/fans/#{@fan.slug}"
        end
    end
    
end