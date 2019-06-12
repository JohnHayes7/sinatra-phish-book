class YearsController < ApplicationController

    get '/years' do 
        if Year.all.empty?
            Scraper.year_scraper
        end
    erb :'years/index'
    end

    
end