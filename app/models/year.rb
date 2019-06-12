class Year < ActiveRecord::Base
    has_many :shows
    
    # def initialize(year)
    #     @shows = []
    #     @value = year
    #     @@all << self
    # end

    
end