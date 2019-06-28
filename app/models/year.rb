class Year < ActiveRecord::Base
    has_many :shows

    def scrape_shows
        shows = Show.in_year_of(self)
            
                if shows.empty?
                    Scraper.show_info_scraper(self.value)
                    added_shows = Show.in_year_of(self)
                    added_shows.each do |s|
                        s.year_id = self.id
                        s.save
                    end
                else
                    shows.each do |s|
                        s.year_id = self.id
                        s.save
                    end
                end
    end
end