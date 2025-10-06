create view average_using_time as
select round(avg(return_date - issue_date)) as average_using
from mainlib.lending_books;

create view issue_quantity_by_reader as
select reader_id, count(cipher) as lendings_qiantity_by_reader
from mainlib.lending_books
group by reader_id;

create view issue_quantity_by_book as
select cipher, count(cipher) as lendings_quantity_by_book
from mainlib.lending_books 
group by cipher;

create view books_quantity_by_house as
select publishing_house, count(cipher) as books_by_house
from mainlib.books
group by publishing_house;

create view books_quantity_by_genre as
select genre, count(cipher) as books_by_genre
from mainlib.books 
group by genre;





