# frozen_string_literal: true

require 'date'
require_relative 'music_album'
require_relative '../genre/genre'
# rubocop:disable Layout/LineLength
module MusicAlbumMenuMethods
  def add_music_album
    label = create_label
    publish_date = check_date_format
    spotify = on_spotify?

    genre = create_genre
    author = obtain_author('artist')

    album = MusicAlbum.new(publish_date, on_spotify: spotify)
    genre.add_item(album)
    author.add_item(album)
    label.add_item(album)

    @genres << genre unless [*@genres].include?(genre)
    @labels << label unless [*@labels].include?(label)
    @author_list << author unless [*@author_list].include?(author)

    puts_message 'Music album created successfully'
    @music_album << album
  end

  def list_all_music_album
    if @music_album.empty?
      puts_message 'No music album in the collection'
      return
    end
    @music_album.each do |album|
      on_spotify = album.on_spotify ? 'Yes' : 'No'
      puts "ID:#{album.id} | Album title: #{album.label.title} | Genre: #{album.genre.name} | Release date:#{album.publish_date} | on spotify:#{on_spotify}"
    end
  end

  private

  def check_date_format
    check_date = lambda do
      date = get_user_input 'Album publish date(yy/mm/dd): '
      return Date.parse(date) if validate_date(date)

      puts_message 'Invalid Date or format: please enter correct date'
      check_date.call
    end
    check_date.call
  end

  def on_spotify?
    spotify = lambda do
      spotify = get_user_input('Is it on spotify? y or n: ').downcase
      case spotify
      when 'n'
        return false
      when 'y'
        return true
      else
        puts_message 'Please enter "y" for Yes or "n" for No'
        spotify.call
      end
    end
    spotify.call
  end

  def get_user_input(key = '')
    puts "\n"
    print key
    gets.chomp
  end

  def puts_message(message)
    puts "\n"
    puts message
    puts "\n"
  end
end
# rubocop:enable Layout/LineLength
