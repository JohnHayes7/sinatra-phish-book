class MemoriesController < ApplicationController

    get '/memories/:slug/new' do
        redirect_if_not_logged_in
            @show = Show.find_by_slug(params[:slug])
            if current_user(session).shows.include?(@show)
            erb :'/memories/create'
            else
                flash[:your_shows] = "You can only add memories to your shows.  Add this show to your collection to leave a memory."
            redirect "/shows/#{@show.date_slug}"
            end
    end

    get '/memories/:id/edit' do
        redirect_if_not_logged_in
        @mem = Memory.find_by_id(params[:id])
        @show = Show.find_by(:id => @mem.show_id)
            if @mem.fan_id == current_user(session).id
                erb :'memories/edit'
            else
                flash[:edit_creds] = "You can only edit your memories"
                redirect "/shows/#{@show.date_slug}"
            end
    end

    post '/memories/:slug' do
        @show = Show.find_by_slug(params[:slug])
        @mem = Memory.new(:content => params[:content])
        @mem.fan_id = current_user(session).id
        @mem.show_id = @show.id

        @mem.save
    redirect "/shows/#{@show.date_slug}"
    end

    patch '/memories/:id/edit' do    
        @mem = Memory.find_by_id(params[:id])
        @show = Show.find_by(:id => @mem.show_id)
        if !params[:content].empty? && @mem.fan_id == current_user(session).id
            @mem.update(:content => params[:content])
            @mem.save
            redirect "/shows/#{@show.date_slug}"
        else
            redirect "/memories/#{@mem.id}/edit"
        end
    end

    delete '/memories/:id/delete' do 
        
        @mem = Memory.find_by(:id => params[:id])
        @show = Show.find_by(:id => @mem.show_id)
        if @mem.fan_id == current_user(session).id
            @mem.destroy
        end

        redirect "/shows/#{@show.date_slug}"
    end

    

end