require 'json'
require './book/book'
require './book/list_books'

module SaveAllData
  def save_data
    books = create_book_object(@books)
    music = create_music_object(@music_album)
    games = create_game_object(@game_list)
    labels = create_label_object(@labels)
    author = create_author_object(@author_list)
    genres = create_genre_object(@genres)

    save_to_file(books, './data/books.json')
    save_to_file(music, './data/music_albums.json')
    save_to_file(games, './data/games.json')
    save_to_file(labels, './data/labels.json')
    save_to_file(author, './data/author.json')
    save_to_file(genres, './data/genres.json')
  end

  private

  def create_book_object(book_array)
    book_array.map do |book|
      { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
        archived: book.archived, label: { id: book.label.id, title: book.label.title, color: book.label.color },
        genre: { id: book.genre.id, name: book.genre.name },
        author: { id: book.author.id, first_name: book.author.first_name, last_name: book.author.last_name } }
    end
  end

  def create_music_object(music_array)
    music_array.map do |music|
      { id: music.id, publish_date: music.publish_date, on_spotify: music.on_spotify,
        archived: music.archived, label: { id: music.label.id, title: music.label.title, color: music.label.color },
        author: { id: music.author.id, first_name: music.author.first_name, last_name: music.author.last_name },
        genre: { id: music.genre.id, name: music.genre.name } }
    end
  end

  def create_game_object(game_array)
    game_array.map do |game|
      { id: game.id, publish_date: game.publish_date, multiplayer: game.multiplayer,
        genre: { id: game.genre.id, name: game.genre.name }, archived: game.archived,
        label: { id: game.label.id, title: game.label.title, color: game.label.color },
        last_played_at: game.last_played_at,
        author: { id: game.author.id, first_name: game.author.first_name, last_name: game.author.last_name } }
    end
  end

  def create_label_object(label_array)
    label_array.map do |label|
      { id: label.id, title: label.title, color: label.color }
    end
  end

  def create_author_object(author_array)
    author_array.map do |author|
      { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
  end

  def create_genre_object(genre_array)
    genre_array.map do |genre|
      { id: genre.id, name: genre.name }
    end
  end

  def save_to_file(array, file_name)
    File.write(file_name, array.to_json)
  end
end
