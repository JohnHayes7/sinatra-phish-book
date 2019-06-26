class ShowsController < ApplicationController
    

    get '/shows/:date_slug' do
        redirect_if_not_logged_in
        @show = Show.find_by_slug(params[:date_slug])
        erb :'/shows/show'
    end

    get '/shows/:slug/add_show' do
       redirect_if_not_logged_in
        @show = Show.find_by_slug(params[:slug])
            if !current_user(session).shows.include?(@show)
                current_user(session).add_show(@show)
                flash[:show_added]= "Show successfully added to your shows"
                redirect "/shows/#{params[:slug]}"
            else
                flash[:show_not_added]="This show is already added to your shows"
                redirect "/shows/#{params[:slug]}"
            end
    end

    get '/shows/:slug/remove' do 
        @show = Show.find_by_slug(params[:slug])
        if current_user(session).shows.include?(@show)
            current_user(session).shows.delete(@show)
            redirect "/fans/#{current_user(session).slug}"
        else
            flash[:remove_error] = "This show is not in your collection of shows"
            redirect "/fans/#{current_user(session).slug}"
        end
    end
    
end