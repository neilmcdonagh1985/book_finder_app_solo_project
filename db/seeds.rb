require_relative('../models/author')
require_relative('../models/book')

Book.delete_all
Author.delete_all

author1 = Author.new({'name' => 'Harper Lee'})
author1.save

author2 = Author.new({'name' => 'George Orwell'})
author2.save

author3 = Author.new({'name' => 'Charles Dickens'})
author3.save

author4 = Author.new({'name' => 'Jane Austen'})
author4.save

book1 = Book.new({'title' => 'To Kill a Mockingbird',
  'buying_price'=> 5, 'selling_price' => 8, 'author_id' => author1.id })
book1.save

book2 = Book.new({'title' => 'Great Expectations', 'buying_price' => 6,
  'selling_price' => 8, 'author_id' => author3.id })
book2.save

book3 = Book.new({'title' => '1984', 'buying_price' => 7,
  'selling_price' => 10, 'author_id' => author2.id })
book3.save

book4 = Book.new({'title' => 'Pride and Prejudice', 'buying_price' => 4,
  'selling_price' => 6, 'author_id' => author4.id })
book4.save

book5 = Book.new({'title' => 'Animal Farm', 'buying_price' => 6,
  'selling_price' => 9, 'author_id' => author2.id })
book5.save
