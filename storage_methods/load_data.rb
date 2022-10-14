# frozen_string_literal: true

module LoadData
  def load_all_data
    read_label
    read_genre
    read_author
    read_book
    read_games
    read_music_albums
  end

  private

  def read_data(file_name)
    file = File.open(file_name)
    if File.exist?(file) && File.read(file) != ''
      data = file.read
      JSON.parse(data)
    else
      []
    end
  end

  def read_music_albums
    read_data('./data/music_albums.json').each do |music|
      new_music = MusicAlbum.new(music['publish_date'], on_spotify: music['on_spotify'],
                                                        id: music['id'], archived: music['archived'])
      genre = @genres.find { |item| item.id == music['genre']['id'] }
      label = @labels.find { |item| item.id == music['label']['id'] }
      author = @author_list.find { |item| item.id == music['author']['id'] }
      genre.add_item(new_music)
      label.add_item(new_music)
      author.add_item(new_music)
      @music_album << new_music
    end
  end

  def read_games
    read_data('./data/games.json').each do |game|
      new_game = Game.new(game['publisher'], game['cover_state'], game['publish_date'], game['id'],
                          archived: game['archived'])
      genre = @genres.find { |item| item.id == game['genre']['id'] }
      label = @labels.find { |item| item.id == game['label']['id'] }
      author = @author_list.find { |item| item.id == game['author']['id'] }
      genre.add_item(new_game)
      label.add_item(new_game)
      author.add_item(new_game)
      @game_list << new_game
    end
  end

  def read_book
    read_data('./data/books.json').each do |book|
      new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['id'],
                          archived: book['archived'])
      genre = @genres.find { |item| item.id == book['genre']['id'] }
      label = @labels.find { |item| item.id == book['label']['id'] }
      author = @author_list.find { |item| item.id == book['author']['id'] }
      genre.add_item(new_book)
      label.add_item(new_book)
      author.add_item(new_book)
      @books << new_book
    end
  end

  def read_label
    @labels = read_data('./data/labels.json').map do |label|
      Label.new(label['title'], label['color'], label['id'])
    end
  end

  def read_genre
    @genres = read_data('./data/genres.json').map do |genre|
      Genre.new(genre['name'], genre['id'])
    end
  end

  def read_author
    @author_list = read_data('./data/author.json').map do |author|
      Author.new(author['first_name'], author['last_name'], author['id'])
    end
  end
end
