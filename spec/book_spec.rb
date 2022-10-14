require_relative '../book/book'
require_relative 'date'

describe Book do
  context 'test book class' do
    date = Date.parse('2000/01/01')
    book = Book.new('Victor', 'Good', '2002/10/10')
    it 'Book publisher should return Victor' do
      expect(book.publisher).to eq 'Victor'
    end
    it 'Book cover_state should return Good' do
      expect(book.cover_state).to eq 'Good'
    end
    it 'Book publish_date should return 2002/10/10' do
      expect(book.publish_date).to eq '2002/10/10'
    end
    it 'Book can_be_archived should return true' do
      date = Date.parse('2000/01/01')
      book = Book.new('Victor', 'bad', date)
      expect(book.send(:can_be_archived?)).to be true
    end
    it 'Book can_be_archived should return false' do
      date = Date.parse('2015/01/01')
      book2 = Book.new('Victor', 'Good', date)
      expect(book2.send(:can_be_archived?)).to be false
    end
    it 'Book can_be_archived should return true' do
      date = Date.parse('2000/01/01')
      book2 = Book.new('Victor', 'Bad', date)
      expect(book2.move_to_archive).to be true
    end
    it 'should return the date' do
      expect(book).to be_a Book # the new way
    end
  end
end
