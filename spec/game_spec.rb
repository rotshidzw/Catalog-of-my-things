require_relative '../games/game'

describe Game do
  before :each do
    @game = Game.new(Date.new(2017, 1, 1), true, Date.new(2017, 1, 1))
  end

  describe '#new' do
    it 'takes 3 params and returns a game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  it 'returns true if the game can be archived' do
    @game2 = Game.new(Date.new(2010, 1, 1), true, Date.new(2010, 1, 1))
    expect(@game2.send(:can_be_archived?)).to be true # because last played is more than 2 years

    @game3 = Game.new(Date.today, true, Date.today)
    expect(@game3.send(:can_be_archived?)).to be false
  end
end
