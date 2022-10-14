require './item'
require './genre/genre'
require './label/label'
require './author/author'
require './author/create_author'

class Game < Item
  attr_reader :last_played_at, :multiplayer

  def initialize(publish_date, multiplayer, last_played_at, id = Random.rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at # #date object: date_format: YYYY-mm-dd
  end

  private

  def can_be_archived?
    return false if @last_played_at.nil?

    (Date.today.year - @last_played_at.year) > 2 && super
  end
end
