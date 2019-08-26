require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require 'sinatra/reloader' if development?
also_reload('../models/*')

get '/authors' do
  @authors = Author.all
  erb(:"authors/index")
end

get '/authors/new' do
  erb(:"authors/new")
end

post '/authors' do
  Author.new(params).save
  redirect to '/authors'
end

get '/authors/:id' do
  @author = Author.find(params['id'])
  @books = Book.all
  erb(:"authors/show")
end

# post '/books/:id' do
#   book = Book.new(params)
#   book.update
#   redirect to "/books/#{params['id']}"
# end
