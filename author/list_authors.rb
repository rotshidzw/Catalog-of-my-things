class ListAuthors
  attr_reader :author_list

  def initialize(author_list)
    @author_list = author_list
  end

  def list_authors
    puts "Authors List:\n"
    @author_list.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name.capitalize} #{author.last_name.capitalize}\n"
    end
    puts "\n"
  end
end
