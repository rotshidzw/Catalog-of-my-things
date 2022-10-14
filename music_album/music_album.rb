require_relative '../item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify
  attr_reader :id

  def initialize(publish_date, on_spotify: false, id: Random.rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super and @on_spotify
  end
end
