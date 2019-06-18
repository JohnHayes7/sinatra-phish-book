class MemoriesController < ApplicationController

    get '/memories/:slug/new' do
        if logged_in?(session)
        @show = Show.find_by_slug(params[:slug])
        erb :'/memories/create'
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

end