require_relative 'item'

class MusicAlbum < Item
    def initialize(id, publish_date, on_spotify)
        super(id, publish_date)
        @on_spotify = on_spotify
    end
end