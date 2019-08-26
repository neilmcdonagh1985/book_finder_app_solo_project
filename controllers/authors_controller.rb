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
