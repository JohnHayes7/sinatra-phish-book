class Fan < ActiveRecord::Base
    has_many :shows
    has_many :memories, through: :shows

    has_secure_password

    def slug
        self.username.downcase.split.join(" - ")
    end

    def self.find_by_slug(username_slug)
        self.all.find {|f| f.slug == username_slug}
    end

end