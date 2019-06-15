class ShowsController < ApplicationController

    get '/shows/:year' do
    @year = Year.find_by(:value => params[:year])
    binding.pry
    erb :'shows/show'
    end

end