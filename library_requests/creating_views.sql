create view mainlib.average_using_time as
select round(avg(return_date - issue_date)) as average_using
from mainlib.lending_books;

COMMENT ON view mainlib.average_using_time
IS 'Выводит среднюю продолжительность пользования книгами.';

create view mainlib.issue_quantity_by_reader as
select reader_id, count(cipher) as lendings_qiantity_by_reader
from mainlib.lending_books
group by reader_id;

COMMENT ON view mainlib.issue_quantity_by_reader
IS 'Выводит количество выдач по читателям.';

create view mainlib.issue_quantity_by_book as
select cipher, count(cipher) as lendings_quantity_by_book
from mainlib.lending_books 
group by cipher;

COMMENT ON view mainlib.issue_quantity_by_book
IS 'Выводит количество выдач по книгам.';

create view mainlib.books_quantity_by_house as
select publishing_house, count(cipher) as books_by_house
from mainlib.books
group by publishing_house;

COMMENT ON view mainlib.books_quantity_by_house
IS 'Выводит количество книг по изданиям.';

create view mainlib.books_quantity_by_genre as
select genre, count(cipher) as books_by_genre
from mainlib.books 
group by genre;

COMMENT ON view mainlib.books_quantity_by_genre
IS 'Выводит количество книг по жанрам.';

create view libwork.average_sal_by_branch as
select branch, round(avg(salary)) as average_salary
from libwork.employees 
group by branch;

COMMENT ON view libwork.average_sal_by_branch
IS 'Выводит среднюю зарплату по филлиалам.';

create view libwork.employees_amount as
select branch, count(id) as employee_by_branch
from libwork.employees
group by branch;

COMMENT ON view libwork.employees_amount
IS 'Выводит количество сотрудников в каждом филлиале.';

create view libwork.min_max_year as
select extract(year from min(hire_date)) as earliest_year, extract(year from max(hire_date)) as latest_year
from libwork.employees;

COMMENT ON view libwork.min_max_year
IS 'Выводит самый ранний и самый поздний год приема на работу.';

create view mainlib.average_rate_by_book as 
select cipher, round(avg(rating), 1) as avr_rating
from mainlib.reviews
group by cipher;

COMMENT ON view mainlib.average_rate_by_book
IS 'Выводит средний рецтинг по каждой книге.';

create view mainlib.review_quantity as
select cipher, count(cipher) as quantity
from mainlib.reviews
group by cipher;

COMMENT ON view mainlib.review_quantity
IS 'Выводит количество отзывов по каждой книге.';

create view mainlib.average_rate_by_months as
select extract(month from review_date), round(avg(rating), 1) as rating
from mainlib.reviews
group by extract(month from review_date);

COMMENT ON view mainlib.average_rate_by_months
IS 'Выводит средний рейтинг по месяцам.';

create view mainlib.top_5_books_by_rev_quantity as 
select cipher, count(cipher) as review_amount
from mainlib.reviews
group by cipher
order by review_amount desc 
limit 5;

COMMENT ON view mainlib.top_5_books_by_rev_quantity
IS 'Выводит топ 5 книг по количеству отзывов.';

create view mainlib.min_max_rate as
select min(rating) as min_rate, max(rating) as max_rate
from mainlib.reviews;

COMMENT ON view mainlib.min_max_rate
IS 'Выводит самый низкий и самый высокий рейтинг за все время.';

