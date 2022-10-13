require './author/author'
require './games/game'

describe Author do
  before :each do
    @author = Author.new('Ali', 'Baba')
    @game = Game.new(Date.new(2017, 1, 1), true, Date.new(2017, 1, 1))
  end

  describe '#new' do
    it 'Should create an instance of Author' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe '#add_item' do
    it 'Should Add item author list' do
      @author.add_item(@game)
      expect(@author.items).to include(@game)
    end
  end
end
