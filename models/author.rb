require_relative('../db/sql_runner')

class Author

  attr_accessor :last_name, :first_name, :books
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @last_name = options['last_name']
    @first_name = options['first_name']
    @books = []
  end

  def save
    sql = "INSERT INTO authors (last_name, first_name) VALUES ($1, $2) returning id"
    values = [@last_name, @first_name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update
    sql = "UPDATE authors SET (last_name, first_name) = ($1, $2) WHERE id = $3"
    values = [@last_name, @first_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM authors"
    author_data = SqlRunner.run(sql)
    authors = map_items(author_data)
    return authors
  end

  def self.map_items(author_data)
    author_data.map { |author| Author.new(author) }
  end

  def self.find(id)
    sql = "SELECT * FROM authors WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    author = Author.new(result)
    return author
  end

  def format_name
    return "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def find_books
    sql = "SELECT * FROM books WHERE author_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    books = result.map { |book| Book.new(book) }
    return books
  end

  def delete
    sql = "DELETE FROM authors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def find_author_by_name(id)
  #   sql = "SELECT last_name, first_name FROM authors WHERE authors.id = $1"
  #   values = [@id]
  #   author = SqlRunner.run(sql, values).first
  #   return author
  # end

end
