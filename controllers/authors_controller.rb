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

post '/authors/:id/delete' do
  author = Author.find(params[:id])
  author.delete
  redirect to "/authors"
end
