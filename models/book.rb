require_relative('../db/sql_runner')

class Book

  attr_accessor :title, :buying_price, :selling_price, :author_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @buying_price = options['buying_price']
    @selling_price = options['selling_price']
    @author_id = options['author_id']
  end

  def save
    sql = "INSERT INTO books
    (title, buying_price, selling_price, author_id)
    VALUES ($1, $2, $3, $4) returning id"
    values = [@title, @buying_price, @selling_price, @author_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE books SET (title, buying_price, selling_price, author_id)
    = ($1, $2, $3, $4) WHERE id = ($5)"
    values = [@title, @buying_price, @selling_price, @author_id, @id]
    SqlRunner.run(sql, values)
  end

end
