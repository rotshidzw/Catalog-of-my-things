# frozen_string_literal: true

class Genre
  attr_reader :name, :id
  attr_accessor :items

  def initialize(name)
    @name = name
    @id = rand(1..100)
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end
end
