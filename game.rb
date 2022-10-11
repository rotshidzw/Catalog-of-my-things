require_relative 'item'

class Game < item
    def initialize(id, publish_date, multiplayer, last_played_at)
        super(id, publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        if @last_played_at < 2.years.ago
            return true
        else
            return false
        end
    end
end