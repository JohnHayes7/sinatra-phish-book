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
        
    erb :'memories/edit'
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