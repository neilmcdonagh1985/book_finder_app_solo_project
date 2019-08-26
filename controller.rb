require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/book')
require 'sinatra/reloader' if development?
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/books' do
  @books = Book.all
  erb(:index)
end

get '/books/new' do
  erb(:new)
end

post '/books' do
  Book.new(params).save
  redirect to '/books'
end

get '/books/:id' do
  @book = Book.find(params['id'])
  erb(:show)
end

get '/books/:id/edit' do
  @books = Book.all
  @book = Book.find(params['id'])
  erb(:edit)
end

post '/books/:id' do
  book = Book.new(params)
  book.update
  redirect to "/books/#{params['id']}"
end
