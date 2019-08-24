DROP TABLE books;
DROP TABLE authors;

CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE books (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  buying_price INT4,
  selling_price INT4,
  author_id INT8 REFERENCES authors(id)
);
