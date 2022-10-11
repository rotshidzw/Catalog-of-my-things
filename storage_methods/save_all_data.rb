require 'json'
require './book/book'
require './book/list_books'

module SaveAllData
  def save_data
    books = create_book_object(@books)
    labels = create_label_object(@labels)
    save_to_file(books, './data/books.json')
    save_to_file(labels, './data/labels.json')
  end

  def create_book_object(book_array)
    book_array.map do |book|
      { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
        archived: book.archived, label: { id: book.label.id, title: book.label.title, color: book.label.color },
        genre: { id: book.genre.id, name: book.genre.name },
        author: { id: book.author.id, first_name: book.author.first_name, last_name: book.author.last_name } }
    end
  end

  def create_label_object(label_array)
    label_array.map do |label|
      { id: label.id, title: label.title, color: label.color }
    end
  end
end
