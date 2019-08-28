require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require 'sinatra/reloader' if development?
also_reload('../models/*')
require('pry')

get '/' do
  erb(:"books/home")
end

get '/books' do
  @books = Book.all
  @authors = Author.all
  @bgenres = []
  @books.each do |book|
    @bgenres << book.genre
  end
  @bgenres.uniq!
  erb(:"books/index")
end

get '/books/new' do
  @authors = Author.all
  erb(:"books/new")
end

post '/books' do
  Book.new(params).save
  @authors = Author.all
  redirect to '/books'
end

get '/books/:id' do
  @book = Book.find(params['id'])
  erb(:"books/show")
end

get '/books/:id/edit' do
  @authors = Author.all
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

get '/filter' do
  @all_books = Book.all
  @authors = Author.all
  @bgenres = []
  @all_books.each do |book|
    @bgenres << book.genre
  end
  @bgenres.uniq!
  @books = Book.select_all_from_same_genre(params["genre"])
  erb(:"books/index")
end
