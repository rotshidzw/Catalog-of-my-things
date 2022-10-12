# the Label class
class Label
  # the Label class
  attr_accessor :title, :color
  attr_reader :item, :id

  def initialize(title, color, id = Random.rand(1...1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
