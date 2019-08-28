require_relative('../db/sql_runner')

class Book

  attr_accessor :title, :buying_price, :selling_price, :author_id,
  :genre, :amount_in_stock, :year_of_publication, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @buying_price = options['buying_price'].to_i
    @selling_price = options['selling_price'].to_i
    @author_id = options['author_id'].to_i
    @genre = options['genre']
    @amount_in_stock = options['amount_in_stock'].to_i
    @year_of_publication = options['year_of_publication'].to_i
  end

  def save
    sql = "INSERT INTO books
    (title, buying_price, selling_price, author_id, genre, amount_in_stock, year_of_publication)
    VALUES ($1, $2, $3, $4, $5, $6, $7) returning id"
    values = [@title, @buying_price, @selling_price, @author_id,
      @genre, @amount_in_stock, @year_of_publication]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE books SET (title, buying_price, selling_price, author_id,
    genre, amount_in_stock, year_of_publication)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = ($8)"
    values = [@title, @buying_price, @selling_price, @author_id,
      @genre, @amount_in_stock, @year_of_publication, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM books where id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    book = Book.new(result)
    return book
  end

  def find_author
    sql = "SELECT * FROM authors WHERE id = $1"
    values = [@author_id]
    result = SqlRunner.run(sql, values).first
    author = Author.new(result)
    return author
  end

  def show_low_stock
    if @amount_in_stock <= 2
      "Low-Stock"
    end
  end

  def self.all
    sql = "SELECT * FROM books"
    book_data = SqlRunner.run(sql)
    books = map_items(book_data)
    return books
  end

  def self.map_items(book_data)
    book_data.map { |book| Book.new(book) }
  end

  def convert_buying_price_to_pounds
    pounds = @buying_price / 100
    pence = @buying_price % 100
    pence = '00' if pence == 0
    "£#{pounds}.#{pence}"
  end

  def convert_selling_price_to_pounds
    pounds = @selling_price / 100
    pence = @selling_price % 100
    pence = '00' if pence == 0
    "£#{pounds}.#{pence}"
  end

  def self.print_all_classics
    sql = "SELECT * FROM books WHERE genre = $1"
    values = ['classic']
    result = SqlRunner.run(sql, values)
    classic_novels = result.map { |book| Book.new(book) }
  end

  def self.select_all_from_same_genre(genre)
    sql = "SELECT * FROM books WHERE genre = $1"
    values = [genre]
    result = SqlRunner.run(sql, values)
    map_items(result)
  end

  # def self.books_by_authors_name
  #   sql = "SELECT * FROM authors ORDER BY last_name"
  #   result = SqlRunner.run(sql)
  #   authors_in_order = result.map { |author| Author.new(author) }
  # end


end
