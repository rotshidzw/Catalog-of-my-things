require './label/label'
require './book/book'
describe Label do
  context 'test label class' do
    book = Book.new('Macmilan', 'bad', '2000-01-02')
    label = Label.new('Working', 'Red')
    it 'label title should return Working' do
      expect(label.title).to eq 'Working'
    end
    it 'label color should return Red' do
      expect(label.color).to eq 'Red'
    end
    it 'Should add an item when add_item method is called' do
      label = Label.new('Sew', 'Blue')
      label.add_item(book)
      expect(book.label.title).to eq 'Sew'
      expect(book.label.color).to eq 'Blue'
    end
    it 'should return the date' do
      expect(label).to be_an_instance_of Label # the new way
    end
  end
end