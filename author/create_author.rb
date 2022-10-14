require './author/Author'
class CreateAuthor
  def initialize()
    puts "\n"
    puts 'Enter first name: '
    first_name = gets.chomp

    puts 'Enter last name: '
    last_name = gets.chomp
    @author = Author.new(first_name, last_name)
  end

  def return_author
    @author
  end
end
