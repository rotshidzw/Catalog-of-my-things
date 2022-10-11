# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
require './execution'
module Options
  def display_options
    execution = Execution.new
    execution.load_all_data
    loop do
      puts "\nPlease choose an option by entering a number:

        1 - List all books.
        2 - List all music albums.
        3 - List of games
        4 - List all genre
        5 - List all labels
        6 - List all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a game.
        0 - quit!"

      option = gets.chomp

      if number?(option)
        process_input(option.to_i, execution)
      else
        show_error
      end
    end
  end

  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.\d+)?\z/.match(obj)
  end

  def process_input(option, execution)
    case option

    when 1
      execution.list_all_books
    when 2
      execution.list_all_music_album
    when 3
      execution.list_games
    when 4
      execution.list_all_genre
    when 5
      execution.list_all_label
    when 6
      execution.list_authors
    when 7
      execution.add_book
    when 8
      execution.add_music_album
    when 9
      execution.add_game
    when 0
      quit(execution)
    else
      show_error
    end
  end

  def show_error
    puts 'Error! Please select a valid option.'
  end

  def quit(execution)
    # save your files to json
    execution.save_data
    puts 'saving your data ...'

    puts "Thanks for using Using The catalog of things\n"
    exit
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
