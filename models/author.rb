require_relative('../db/sql_runner')

class Author

  attr_accessor :name, :books
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @books = []
  end

  def save
    sql = "INSERT INTO authors (name) VALUES ($1) returning id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update
    sql = "UPDATE authors SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

end
