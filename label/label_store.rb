# frozen_string_literal: true

require 'json'
require './label'

# the book module
module LabelStore
  def load_labels
    label_store = []
    label_file = open('./labels.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = label_file.read
      JSON.parse(data).each do |book|
        label_store << Book.new(book['id'], book['publisher'], book['cover_state'])
      end
    else
      File.write(label_file, '[]')
    end
    label_store
  end

  def save_books_to_file
    label_store = []
    @labels.each do |label|
      label_store << { id: label.id, title: label.title, color: label.color }
    end
    File.write('./labels.json', label_store.to_json)
  end
end
