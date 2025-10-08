create view mainlib.average_using_time as
select round(avg(return_date - issue_date)) as average_using
from mainlib.lending_books;

create view mainlib.issue_quantity_by_reader as
select reader_id, count(cipher) as lendings_qiantity_by_reader
from mainlib.lending_books
group by reader_id;

create view mainlib.issue_quantity_by_book as
select cipher, count(cipher) as lendings_quantity_by_book
from mainlib.lending_books 
group by cipher;

create view mainlib.books_quantity_by_house as
select publishing_house, count(cipher) as books_by_house
from mainlib.books
group by publishing_house;

create view mainlib.books_quantity_by_genre as
select genre, count(cipher) as books_by_genre
from mainlib.books 
group by genre;

create view libwork.average_sal_by_branch as
select branch, round(avg(salary)) as average_salary
from libwork.employees 
group by branch;

create view libwork.employees_amount as
select branch, count(id) as employee_by_branch
from employees
group by branch;

create view libwork.min_max_year as
select extract(year from min(hire_date)) as earliest_year, extract(year from max(hire_date)) as latest_year
from employees;

create view mainlib.average_rate_by_book as 
select cipher, round(avg(rating), 1) as avr_rating
from reviews
group by cipher;

create view mainlib.review_quantity as
select cipher, count(cipher) as quantity
from reviews
group by cipher;

create view mainlib.average_rate_by_book as 
select cipher, round(avg(rating), 1) as avr_rating
from reviews
group by cipher;

create view mainlib.average_rate_by_months as
select extract(month from review_date), round(avg(rating), 1) as rating
from reviews
group by extract(month from review_date);

create view mainlib.top_5_books_by_rev_quantity as 
select cipher, count(cipher) as review_amount
from reviews
group by cipher
order by review_amount desc 
limit 5;

create view mainlib.min_max_rate as
select min(rating) as min_rate, max(rating) as max_rate
from reviews;

