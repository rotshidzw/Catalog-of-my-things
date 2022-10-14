# frozen_string_literal: true

require './music_album/music_album'

describe MusicAlbum do
  context 'test musicalbum class' do
    date = Date.parse('2000/01/01')
    music = MusicAlbum.new(date, on_spotify: false)
    it 'should return the date' do
      expect(music.publish_date).to eq date
    end
    it 'should return the on_spotify' do
      expect(music.on_spotify).to be false
    end
    it 'should return true' do
      date = Date.parse('2000/01/01')
      music1 = MusicAlbum.new(date, on_spotify: true)
      expect(music1.send(:can_be_archived?)).to be true
    end
    it 'should return true' do
      date = Date.parse('2000/01/01')
      music1 = MusicAlbum.new(date, on_spotify: false)
      expect(music1.send(:can_be_archived?)).to be false
    end
    it 'should return the date' do
      expect(music).to be_a MusicAlbum # the new way
      # music.should be_an_instance_of(MusicAlbum) # the old way
    end
  end
end
