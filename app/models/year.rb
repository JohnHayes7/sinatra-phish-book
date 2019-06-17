class Year < ActiveRecord::Base
    has_many :shows

    # def add_show(year)
    
    # shows = Scraper.show_info_scraper(year) 
    # shows.each do |s|
        
    #     Show.new(:date => s[0], :venue => s[1], :location => s[2], :setlist => s[3])
    #     binding.pry 
    # end
    #     Show.all.each do |s|
    #         if s[:date].split(" ")[1].split("/").last.to_i == @year.value
    #         shows << s
    #         end
    #     end
    # end

end