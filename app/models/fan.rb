class Fan < ActiveRecord::Base
    has_many :shows
    has_many :memories, through: :shows

end