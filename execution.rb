# frozen_string_literal: true

require './book/create_book'
require './label/create_label'
require './book/list_books'
require './storage_methods/save_all_data'
require './storage_methods/load_data'

class Execution
  include AddLabel
  include AddBook
  include ListBook
  include LoadData
  include SaveAllData

  def initialize
    @books = []
    @labels = []
  end
end
