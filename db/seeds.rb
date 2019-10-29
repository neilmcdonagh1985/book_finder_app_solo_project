require_relative('../models/author')
require_relative('../models/book')

Book.delete_all
Author.delete_all

author1 = Author.new({'last_name' => 'Lee', 'first_name' => 'Harper'})
author1.save

author2 = Author.new({'last_name' => 'Orwell', 'first_name' => 'George'})
author2.save

author3 = Author.new({'last_name' => 'Dickens', 'first_name' => 'Charles'})
author3.save

author4 = Author.new({'last_name' => 'Austen', 'first_name' => 'Jane'})
author4.save

author5 = Author.new({'last_name' => 'Chandler', 'first_name' => 'Raymond'})
author5.save

author6 = Author.new({'last_name' => 'Follett', 'first_name' => 'Ken'})
author6.save

book1 = Book.new({'title' => 'To Kill a Mockingbird',
  'buying_price'=> 550, 'selling_price' => 800, 'author_id' => author1.id,
  'genre' => 'classic', 'amount_in_stock' => 3, 'year_of_publication' => 1960 })
book1.save

book2 = Book.new({'title' => 'Great Expectations', 'buying_price' => 600,
  'selling_price' => 800, 'author_id' => author3.id, 'genre' => 'classic',
  'amount_in_stock' => 2, 'year_of_publication' => 1861 })
book2.save

book3 = Book.new({'title' => '1984', 'buying_price' => 750,
  'selling_price' => 1050, 'author_id' => author2.id,
  'genre' => 'dystopian', 'amount_in_stock' => 2, 'year_of_publication' => 1949 })
book3.save

book4 = Book.new({'title' => 'Pride and Prejudice', 'buying_price' => 400,
  'selling_price' => 650, 'author_id' => author4.id,
  'genre' => 'classic', 'amount_in_stock' => 1, 'year_of_publication' => 1813 })
book4.save

book5 = Book.new({'title' => 'Animal Farm', 'buying_price' => 600,
  'selling_price' => 900, 'author_id' => author2.id,
  'genre' => 'political fiction', 'amount_in_stock' => 5, 'year_of_publication' => 1945 })
book5.save

book6 = Book.new({'title' => 'The Big Sleep', 'buying_price' => 500,
  'selling_price' => 850, 'author_id' => author5.id,
  'genre' => 'crime', 'amount_in_stock' => 3, 'year_of_publication' => 1993 })
book6.save

book7 = Book.new({'title' => 'Fall of Giants', 'buying_price' => 480,
  'selling_price' => 1030, 'author_id' => author6.id,
  'genre' => 'historical fiction', 'amount_in_stock' => 4, 'year_of_publication' => 2010 })
book7.save
