class Fan < ActiveRecord::Base
    has_many :shows
    has_many :memories, through: :shows

    has_secure_password

    def slug
        self.username.split.join(" - ")
    end

    def self.find_by_slug(slug)
        self.all.find do |f|
            if f.slug == slug
                f
            end
        end
    end

end