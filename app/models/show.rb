class Show < ActiveRecord::Base
    has_many :fans
    has_many :memories, through: :fans    

end