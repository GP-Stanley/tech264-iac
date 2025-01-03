CREATE TABLE IF NOT EXISTS books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  isbn VARCHAR(13) UNIQUE
);

INSERT INTO books (title, author, isbn) VALUES 
('To Kill a Mockingbird', 'Harper Lee', '9780446310789'),
('1984', 'George Orwell', '9780451524935'),
('Pride and Prejudice', 'Jane Austen', '9780141439518');
