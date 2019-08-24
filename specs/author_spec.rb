require('minitest/autorun')
require('minitest/rg')
require_relative('../models/author')

class AuthorTest < MiniTest::Test

  def setup
    @author1 = Author.new({'last_name' => 'Lee', 'first_name' => 'Harper'})
    @author2 = Author.new({'last_name' => 'Orwell', 'first_name' => 'George'})
  end

  def test_return_author_first_name
    assert_equal('George', @author2.first_name)
  end

  def test_return_author_last_name
    assert_equal('Lee', @author1.last_name)
  end

  def test_return_books_of_an_author
    assert_equal([], @author2.books)
  end

end
