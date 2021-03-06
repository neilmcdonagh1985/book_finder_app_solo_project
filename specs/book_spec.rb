require('minitest/autorun')
require('minitest/rg')
require_relative('../models/book')
require_relative('../models/author')

class BookTest < MiniTest::Test

  def setup
    @author1 = Author.new({'last_name' => 'Lee', 'first_name' => 'Harper'})
    @author2 = Author.new({'last_name' => 'Orwell', 'first_name' => 'George'})
    @author4 = Author.new({'last_name' => 'Austen', 'first_name' => 'Jane'})

    @book1 = Book.new({'id' => 20, 'title' => 'To Kill a Mockingbird',
      'buying_price'=> 5, 'selling_price' => 8, 'author_id' => @author1.id,
      'genre' => 'classic', 'amount_in_stock' => 3, 'decade' => 1950 })
    @book3 = Book.new({'title' => '1984', 'buying_price' => 7,
      'selling_price' => 10, 'author_id' => @author2.id,
      'genre' => 'dystopian', 'amount_in_stock' => 2, 'decade' => 1940 })
    @book4 = Book.new({'title' => 'Pride and Prejudice', 'buying_price' => 4,
      'selling_price' => 6, 'author_id' => @author4.id,
      'genre' => 'classic', 'amount_in_stock' => 1, 'decade' => 1810 })
  end


  def test_book_title
    assert_equal('To Kill a Mockingbird', @book1.title)
  end

  def test_book_buying_price
    assert_equal(5, @book1.buying_price)
  end

  def test_book_selling_price
    assert_equal(10, @book3.selling_price)
  end

  def test_book_retrn_genre
    assert_equal('dystopian', @book3.genre)
  end

  def test_amount_in_stock_for_a_book
    assert_equal(3, @book1.amount_in_stock)
  end

  def test_book_id
    assert_equal(20, @book1.id)
  end
end
