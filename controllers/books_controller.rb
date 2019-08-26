require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require 'sinatra/reloader' if development?
also_reload('../models/*')

get '/' do
  erb(:"books/home")
end

get '/books' do
  @books = Book.all
  erb(:"books/index")
end

get '/books/new' do
  erb(:"books/new")
end

post '/books' do
  Book.new(params).save
  redirect to '/books'
end

get '/books/:id' do
  @book = Book.find(params['id'])
  erb(:"books/show")
end

get '/books/:id/edit' do
  @book = Book.find(params['id'])
  erb(:"books/edit")
end

post '/books/:id' do
  book = Book.new(params)
  book.update
  redirect to "/books/#{params['id']}"
end

post '/books/:id/delete' do
  book = Book.find(params['id'])
  book.delete
  redirect to '/books'
end
