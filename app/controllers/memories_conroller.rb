class MemoriesController < ApplicationController

    get '/memories/:slug/new' do
        @show = Show.find_by_slug(params[:slug])
    erb :'/memories/create'
    end

    post '/memories/:slug' do
        @show = Show.find_by_slug(params[:slug])
    
    redirect "/shows/#{@show.date_slug}"
    end
end