module LoadData
    def load_all_data
        read_label
        read_book
    end

    def read_data(file_name)
        file = File.open(file_name)
        if File.exist?(file) && File.read(file) != ''
          data = file.read
          JSON.parse(data)
        else
          []
        end
    end

    def read_book
        read_data('./data/books.json').each do |book|
          new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['id'],
                              archived: book['archived'])
          genre = @genres.find { |item| item.id == book['genre']['id'] }
          label = @labels.find { |item| item.id == book['label']['id'] }
          author = @author_list.find { |item| item.id == book['author']['id'] }
          genre.add_item(new_book)
          label.add_item(new_book)
          author.add_item(new_book)
          @books << new_book
        end
    end
    
    def read_label
        @labels = read_data('./data/labels.json').map do |label|
          Label.new(label['title'], label['color'], label['id'])
        end
    end
