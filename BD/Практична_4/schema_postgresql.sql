-- PostgreSQL 13+; запускати в навчальній базі college після створення схеми college.
CREATE SCHEMA IF NOT EXISTS college;
CREATE TABLE college.books (
 book_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 isbn VARCHAR(13) UNIQUE,
 title VARCHAR(250) NOT NULL CHECK (length(btrim(title)) > 0),
 publication_year SMALLINT CHECK (publication_year BETWEEN 1450 AND 2100),
 category VARCHAR(100),
 CONSTRAINT books_isbn_format CHECK (isbn IS NULL OR isbn ~ '^[0-9]{10}([0-9]{3})?$')
);
CREATE TABLE college.authors (
 author_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 full_name VARCHAR(200) NOT NULL CHECK (length(btrim(full_name)) > 0)
);
CREATE TABLE college.book_authors (
 book_id UUID NOT NULL REFERENCES college.books(book_id) ON DELETE CASCADE,
 author_id UUID NOT NULL REFERENCES college.authors(author_id) ON DELETE CASCADE,
 author_order SMALLINT NOT NULL CHECK (author_order >= 1),
 PRIMARY KEY (book_id, author_id),
 UNIQUE (book_id, author_order)
);
CREATE TABLE college.copies (
 copy_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 book_id UUID NOT NULL REFERENCES college.books(book_id) ON DELETE RESTRICT,
 inventory_number VARCHAR(30) NOT NULL UNIQUE,
 condition VARCHAR(20) NOT NULL DEFAULT 'available' CHECK (condition IN ('available', 'repair', 'lost'))
);
CREATE TABLE college.readers (
 reader_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 card_number VARCHAR(30) NOT NULL UNIQUE,
 full_name VARCHAR(200) NOT NULL CHECK (length(btrim(full_name)) > 0),
 email VARCHAR(254)
);
CREATE TABLE college.librarians (
 librarian_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 employee_number VARCHAR(30) NOT NULL UNIQUE,
 full_name VARCHAR(200) NOT NULL CHECK (length(btrim(full_name)) > 0)
);
CREATE TABLE college.loans (
 loan_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 copy_id UUID NOT NULL REFERENCES college.copies(copy_id) ON DELETE RESTRICT,
 reader_id UUID NOT NULL REFERENCES college.readers(reader_id) ON DELETE RESTRICT,
 librarian_id UUID NOT NULL REFERENCES college.librarians(librarian_id) ON DELETE RESTRICT,
 issued_at DATE NOT NULL DEFAULT CURRENT_DATE,
 due_at DATE NOT NULL,
 returned_at DATE,
 CHECK (due_at >= issued_at),
 CHECK (returned_at IS NULL OR returned_at >= issued_at)
);
CREATE UNIQUE INDEX unique_open_loan_per_copy ON college.loans(copy_id) WHERE returned_at IS NULL;
CREATE INDEX loans_reader_idx ON college.loans(reader_id);
CREATE INDEX copies_book_idx ON college.copies(book_id);
