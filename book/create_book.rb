require 'date'
require './book/book'
require './label/create_label'
# Add book class
module AddBook
  include AddLabel
  # rubocop:disable Metrics/MethodLength:
  def add_book
    print 'Add a book: '
    label = create_label
    print "\nPublisher's Name:  "
    publisher = gets.chomp.strip.capitalize
    print 'Enter the state of cover (good or bad):  '
    cover_state = gets.chomp.strip.capitalize
    book = ''
    print 'publish_date:  '
    check_date = lambda do
      puts 'publish_date (yyyy-mm-dd):'
      publish_date = validate_date(gets.chomp.to_s)
      if publish_date
        book = Book.new(publisher, cover_state, publish_date)
        @books << book
      else
        puts 'Invalid Date or format: please enter correct date'
        puts "\n"
        check_date.call
      end
    end
    check_date.call

    genre = create_genre
    author = obtain_author('author')

    genre.add_item(book)
    author.add_item(book)
    label.add_item(book)

    @genres << genre unless [*@genres].include?(genre)
    @labels << label unless [*@labels].include?(label)
    @author_list << author unless [*@author_list].include?(author)
    puts("Book created successfully', 'Happy learning\n")
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
# rubocop:enable Metrics/MethodLength:
