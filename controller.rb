require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/book')
require 'sinatra/reloader' if development?
also_reload('./models/*')

get '/' do
  # 'Hello World. What a nice day today.'
  erb(:index)
  # @books = Book.all
end
