class Show < ActiveRecord::Base
    has_many :fans
    has_many :memories, through: :fans 
    belongs_to :year   

    def date_slug
        binding.pry
    end
    
end