class ShowsController < ApplicationController
    
    get '/shows/:year' do
    @year = Year.find_by(:value => params[:year])
        #SHOULD REFACTOR BELOW
        if @year.shows.empty?
             shows = Show.all.select {|s| s[:date].split(" ")[1].split("/").last.to_i == @year.value}
             
                if shows.empty?
                    Scraper.show_info_scraper(@year.value)
                    added_shows = Show.all.select {|s| s[:date].split(" ")[1].split("/").last.to_i == @year.value}
                    added_shows.each do |s|
                        s.year_id = @year.id
                        s.save
                    end
                else
                    shows.each do |s|
                        s.year_id = @year.id
                        s.save
                    end
                end
        end
       
    erb :'years/show'
    end

    get '/show/:date_slug' do

    end

    
end