require('minitest/autorun')
require('minitest/rg')
require_relative('../models/author')

class AuthorTest < MiniTest::Test

  def setup
    @author1 = Author.new({'name' => 'Harper Lee'})
    @author2 = Author.new({'name' => 'George Orwell'})
  end

  def test_return_author_name
    assert_equal('Harper Lee', @author1.name)
  end

  def test_return_books_of_an_author
    assert_equal([], @author2.books)
  end

end
