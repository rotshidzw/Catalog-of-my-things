# frozen_string_literal: true

require './book/book'
# require './store'

module ListBook
  def list_all_books
    # puts 'Books'.upcase
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "Book #{index + 1}
        Title: #{book.label.title}
        Genre: #{book.genre.name}
        Publisher: #{book.publisher}
        Cover State: #{book.cover_state}
        Published_date: #{book.publish_date}\n"
      end

    else
      print('There is no book to display', 'kindly add some books\n')
    end
  end
end
