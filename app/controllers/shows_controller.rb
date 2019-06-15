class ShowsController < ApplicationController

    get '/shows/:year' do
    @year = Year.find_by(:value => params[:year])
        if @year.shows.empty?
            Scraper.show_info_scraper(@year.value)
            binding.pry
        end
    erb :'shows/show'
    end

end