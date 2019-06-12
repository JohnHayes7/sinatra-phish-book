class ShowsController < ApplicationController

    get '/show/:year' do
    @year = Year.find_by(:value => params[:year])

    end

end