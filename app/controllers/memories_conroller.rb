class MemoriesController < ApplicationController

    get '/memories/:slug/new' do
        @fan = current_user(session)
        
        if logged_in?(session)
            @show = Show.find_by_slug(params[:slug])
            if @fan.shows.include?(@show)
            erb :'/memories/create'
            else
            redirect "/shows/#{@show.date_slug}"
            end
        else
        redirect "/fans/login"
        end
    end

    get '/memories/:id/edit' do

        if logged_in?(session)
        @mem = Memory.find_by_id(params[:id])
        @fan = current_user(session)
        end
            if @mem.fan_id == @fan.id
                erb :'memories/edit'
            else
                redirect "/fans/#{@fan.slug}"
            end
    end

    post '/memories/:slug' do
        @show = Show.find_by_slug(params[:slug])
        @fan = current_user(session)
        @mem = Memory.new(:content => params[:content])
        @mem.fan_id = @fan.id
        @mem.show_id = @show.id
        @mem.save
        @show.memory_id = @mem.id
        @show.save
    redirect "/shows/#{@show.date_slug}"
    end

    post '/memories/:id/edit' do    
        @mem = Memory.find_by_id(params[:id])
        @show = Show.find_by(:id => @mem.show_id)
        if !params[:content].empty?
            @mem.update(:content => params[:content])
            @mem.save
            redirect "/shows/#{@show.date_slug}"
        else
            redirect "/memories/#{@mem.id}/edit"
        end
    end

    post '/memories/:id/delete' do 
        @mem = Memory.find_by(:id => params[:id])
        @show = Show.find_by(:id => @mem.show_id)
        @mem.destroy

        redirect "/shows/#{@show.date_slug}"
    end

    

end