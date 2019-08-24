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

end
