require './item'

# the book class
class Book < Item
  attr_accessor :publisher

  def initialize(id, publisher, cover_state)
    super()
    @id = id || Random.rand(1...1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archieved?
    return true if super || cover_state == 'bad'

    false
  end
end
