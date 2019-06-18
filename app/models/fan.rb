class Fan < ActiveRecord::Base
    has_and_belongs_to_many :shows
    has_many :memories

    has_secure_password

    def slug
        self.username.downcase.split.join(" - ")
    end

    def self.find_by_slug(username_slug)
        self.all.find {|f| f.slug == username_slug}
    end

    def add_show(show)
        self.shows << show
        show.fans << self
        show.save
        self.save
    end

end