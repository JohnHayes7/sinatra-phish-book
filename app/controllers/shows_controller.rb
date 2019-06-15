class ShowsController < ApplicationController
    
    get '/shows/:year' do
    @year = Year.find_by(:value => params[:year])
        if @year.shows.empty?
            Scraper.show_info_scraper(@year.value)
            year_shows = Show.all.detect do |s|
                 s[:date].split(" ")[1].split("/").last.to_i == @year.value
            binding.pry
            end
        end
    erb :'shows/show'
    end

end