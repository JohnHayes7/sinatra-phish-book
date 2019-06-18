class Show < ActiveRecord::Base
    has_and_belongs_to_many :fans
    has_many :memories 
    belongs_to :year   

    def date_slug
        self[:date].split(" ")[1].split("/").join("-")
    end

    def self.find_by_slug(slug)
        self.all.find {|f| f.date_slug == slug}
    end

    
end