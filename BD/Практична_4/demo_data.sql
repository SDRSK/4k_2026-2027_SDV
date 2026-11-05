-- Демо: запускати після schema_postgresql.sql у базі college.
INSERT INTO college.books (book_id, isbn, title, publication_year, category) VALUES
('11111111-1111-4111-8111-111111111111','9786170000001','Основи баз даних',2024,'Інформатика');
INSERT INTO college.authors (author_id, full_name) VALUES
('22222222-2222-4222-8222-222222222222','Олена Коваль');
INSERT INTO college.book_authors (book_id,author_id,author_order) VALUES
('11111111-1111-4111-8111-111111111111','22222222-2222-4222-8222-222222222222',1);
INSERT INTO college.copies (copy_id,book_id,inventory_number) VALUES
('33333333-3333-4333-8333-333333333333','11111111-1111-4111-8111-111111111111','INV-001');
INSERT INTO college.readers (reader_id,card_number,full_name) VALUES
('44444444-4444-4444-8444-444444444444','R-001','Іван Петренко');
INSERT INTO college.librarians (librarian_id,employee_number,full_name) VALUES
('55555555-5555-4555-8555-555555555555','EMP-001','Марія Савчук');
INSERT INTO college.loans (copy_id,reader_id,librarian_id,issued_at,due_at) VALUES
('33333333-3333-4333-8333-333333333333','44444444-4444-4444-8444-444444444444','55555555-5555-4555-8555-555555555555',DATE '2026-11-05',DATE '2026-11-19');
SELECT b.title,r.full_name,l.issued_at,l.due_at FROM college.loans l
JOIN college.copies c ON c.copy_id=l.copy_id
JOIN college.books b ON b.book_id=c.book_id
JOIN college.readers r ON r.reader_id=l.reader_id;
