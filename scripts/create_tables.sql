-- public.books definition

-- Drop table

-- DROP TABLE public.books;

CREATE TABLE public.books (
	cipher varchar NOT NULL,
	author varchar NULL,
	genre varchar NULL,
	"year" int4 NULL,
	publishing_house varchar NULL,
	description text NULL,
	is_available bool NULL,
	CONSTRAINT books_pkey PRIMARY KEY (cipher)
);

-- public.lending_books definition

-- Drop table

-- DROP TABLE public.lending_books;

CREATE TABLE public.lending_books (
	cipher varchar NULL,
	issue_date date NULL,
	return_date date NULL,
	reader_id int4 NULL,
	CONSTRAINT lending_books_cipher_fkey FOREIGN KEY (cipher) REFERENCES public.books(cipher),
	CONSTRAINT lending_books_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(id)
);

-- public.readers definition

-- Drop table

-- DROP TABLE public.readers;

CREATE TABLE public.readers (
	id int4 NOT NULL,
	surname varchar NULL,
	"name" varchar NULL,
	date_of_birth date NULL,
	address varchar NULL,
	CONSTRAINT readers_pkey PRIMARY KEY (id)
);
