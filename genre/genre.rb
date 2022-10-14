class Genre
  attr_accessor :items, :name
  attr_reader :id

  def initialize(name = 'unknown', id = rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self # Music genre
    @items << item
  end
end
