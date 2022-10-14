# frozen_string_literal: true

require './genre/genre'
require './music_album/music_album'

describe Genre do
  context ' test genre class' do
    genre = Genre.new('Ayo')
    date = Date.parse('2000/01/01')
    music = MusicAlbum.new(date, on_spotify: false)
    it 'Should return Ayo' do
      expect(genre.name).to eq 'Ayo'
    end
    it 'Should return Ayo' do
      genre = Genre.new
      expect(genre.name).to eq 'unknown'
    end
    it 'Should add an item when add_item method is called' do
      genre = Genre.new('Fiction')
      genre.add_item(music)
      expect(music.genre.name).to eq 'Fiction'
    end
  end
end
