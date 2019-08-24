require_relative('../models/author')
require_relative('../models/book')
require('pry')

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

book1 = Book.new({'title' => 'To Kill a Mockingbird',
  'buying_price'=> 5, 'selling_price' => 8, 'author_id' => author1.id,
  'genre' => 'classic', 'amount_in_stock' => 3, 'decade' => 1950 })
book1.save

book2 = Book.new({'title' => 'Great Expectations', 'buying_price' => 6,
  'selling_price' => 8, 'author_id' => author3.id, 'genre' => 'classic',
  'amount_in_stock' => 2, 'decade' => 1860 })
book2.save

book3 = Book.new({'title' => '1984', 'buying_price' => 7,
  'selling_price' => 10, 'author_id' => author2.id,
  'genre' => 'dystopian', 'amount_in_stock' => 2, 'decade' => 1940 })
book3.save

book4 = Book.new({'title' => 'Pride and Prejudice', 'buying_price' => 4,
  'selling_price' => 6, 'author_id' => author4.id,
  'genre' => 'classic', 'amount_in_stock' => 1, 'decade' => 1810 })
book4.save

book5 = Book.new({'title' => 'Animal Farm', 'buying_price' => 6,
  'selling_price' => 9, 'author_id' => author2.id,
  'genre' => 'political fiction', 'amount_in_stock' => 5, 'decade' => 1940 })
book5.save

binding.pry
nil
