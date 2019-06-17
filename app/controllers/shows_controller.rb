class ShowsController < ApplicationController
    
    get '/shows/:year' do
    @year = Year.find_by(:value => params[:year])
        
        if @year.shows.empty?
             shows = Show.all.detect do |s| 
                s[:date].split(" ")[1].split("/").last.to_i == @year.value
                binding.pry
                end
            
            # Scraper.show_info_scraper(@year.value)
            
        end
    erb :'shows/show'
    end

end