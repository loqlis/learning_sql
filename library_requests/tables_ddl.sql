CREATE TABLE mainlib.books (
	cipher varchar NOT NULL,
	author varchar NULL,
	genre varchar NULL,
	"year" int4 NULL,
	publishing_house varchar NULL,
	description text NULL,
	is_available bool NULL,
	CONSTRAINT books_pkey PRIMARY KEY (cipher)
);

CREATE TABLE mainlib.readers (
	id int4 NOT NULL,
	surname varchar NULL,
	"name" varchar NULL,
	date_of_birth date NULL,
	address varchar NULL,
	CONSTRAINT readers_pkey PRIMARY KEY (id)
);

CREATE TABLE mainlib.lending_books (
	cipher varchar NULL,
	issue_date date NULL,
	return_date date NULL,
	reader_id int4 NULL,
	CONSTRAINT lending_books_cipher_fkey FOREIGN KEY (cipher) REFERENCES mainlib.books(cipher),
	CONSTRAINT lending_books_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES mainlib.readers(id)
);

CREATE TABLE mainlib.reviews (
	id int4 NOT NULL,
	cipher varchar NULL,
	reader_id int4 NULL,
	rating int4 NULL,
	review_date date NULL,
	CONSTRAINT reviews_pkey PRIMARY KEY (id),
	CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5))),
	CONSTRAINT reviews_cipher_fkey FOREIGN KEY (cipher) REFERENCES mainlib.books(cipher),
	CONSTRAINT reviews_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES mainlib.readers(id)
);

CREATE TABLE libwork.employees (
	id int4 NOT NULL,
	name varchar NULL,
	hire_date date NULL,
	salary int4 NULL,
	branch varchar NULL,
	CONSTRAINT employees_pkey PRIMARY KEY (id)
);