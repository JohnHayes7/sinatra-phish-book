class Scraper
    require "open-uri"

    def self.year_scraper
        raw_ary = []
        years = []
        site = "http://phish.net/setlists/phish/"
        page = Nokogiri::HTML(open(site))
        page.css("option").each do |y|
            if y.text.size == 4
            raw_ary << y.text
            end
        end
        raw_ary.uniq.each do |y|
            if y.to_i > 0
            years << y
            end
        end
        years.each do |y|
            Year.create(:value => y)
            end
        end

        def self.show_info_scraper(input)
            # site = "http://phish.net/setlists/?year=1983"
            # page = Nokogiri::HTML(open(site))
            # date = page.css(".setlist-date").text.split(" ")
    
            site = "http://phish.net/setlists/?year=#{input}"
            page = Nokogiri::HTML(open(site))
            date = page.css(".setlist-date").text.split(" ")
            
            #DATE
            day_date_ary = []
            date_info = date.delete_if{|d| d.include?("PHISH")}
            date_ary = date_info.each_slice(2).map{|d| "#{d.first} #{d.last}"}
                date_ary.each do |d|
                day_date_ary << d
                end
            # year = date_ary[0].split("/").last
    
            #VENUE
            venue_ary = []
            loc_ary = []
            venue = page.css(".hideunder768")
                venue.each do |v|
                venue_ary << v.text
                end
            # city_state = page.css(".setlist-location")[0].text.split(" ").join(" ")
            city_state = page.css(".setlist-location")
                city_state.each do |c|
                loc_ary << c.text.split(" ").join(" ")
                end

            #SETS
            sets_ary = []
            songs = page.css("div.setlist-body")
            songs.each {|s| sets_ary << s.text.split.join(" ")}   
            sets_ary

    
            show_info = day_date_ary.zip(venue_ary, loc_ary, sets_ary)
            show_info.each do |info|
                PhishBook::Show.new("#{info[0]}", "#{info[1]}", "#{info[2]}", "#{info[3]}")
                end
        end
        
end