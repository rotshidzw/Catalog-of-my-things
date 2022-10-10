require './book/create_book'
require './label/create_label'
require './book/list_books'

class Execution
  include AddLabel
  include AddBook
  include ListBook

  def initialize
    @books = []
    @labels = []
  end
end
