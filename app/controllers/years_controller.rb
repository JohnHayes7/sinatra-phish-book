class YearsController < ApplicationController

    get '/years' do 
        if Year.all.empty?
            Scraper.year_scraper
        end
    erb :'years/index'
    end
    
    get '/years/:year' do
    @year = Year.find_by(:value => params[:year])
    #SHOULD REFACTOR BELOW
        if @year.shows.empty?
            @year.scrape_shows
        end
   
    erb :'years/show'
    end

    
end