from sqlalchemy.orm import Session
from core import Book


class Manager:
    def __init__(self, engine):
        self.eng = engine

    def add_books(self):
        with Session(self.eng) as session:
            book1 = Book(title='Евгений Онегин', author='Пушкин', year=1833)
            book2 = Book(title='Преступление и нраказание', author='Достоевский', year=1866)
            book3 = Book(title='Мастер и Маргарита', author='Булгаков', year=1967)
            book4 = Book(title='Обломов', author='Гончаров', year=1835)
            book5 = Book(title='Чудесный доктор', author='Куприн', year=1967)

            session.add_all([book1, book2, book3, book4, book5])
            session.commit()

    def add_own_books(self) -> None:
        # добавление книг в бд
        with Session(self.eng) as session:
            books = []
            try:
                count = int(input('Введите количество книг, которые хотите добавить: '))
            except ValueError:
                print('Неккореткное значение.')
            for book in range(count):
                try:
                    book = Book(
                        title=input('Введите название книги: '),
                        author=input('Введите автора: '),
                        year=int(input('Введите год выпска книги: ')))
                    books.append(book)
                except ValueError:
                    print('Неккоректное значение.')
            session.add_all(books)
            session.commit()

    def get_books(self) -> None:
        # выводит все книги в бд
        with Session(self.eng) as session:
            books = session.query(Book).all()
            for b in books:
                print(f"{b.id}: {b.title} ({b.author}, {b.year})")

    def change_pushk_books_year(self) -> None:
        # меняет год выпуска книг в бд
        with Session(self.eng) as session:
            book = session.query(Book).filter_by(author='Пушкин').all()
            for b in book:
                b.year = 1831
            session.commit()

    def sort_books(self) -> None:
        # сортирует книги
        with Session(self.eng) as session:
            book = session.query(Book).filter_by(title='Мастер и Маргарита').first()
            session.delete(book)
            session.commit()

    def get_latest_books(self) -> None:
        # выводит книги позднее 1850 года выпусука
        with Session(self.eng) as session:
            books = session.query(Book).filter(Book.year > 1850).all()
            for b in books:
                print(b)

    def change_dost_books_year(self) -> None:
        # меняет год выпсука книг достовеского
        with Session(self.eng) as session:
            try:

                books = session.query().filter_by(author='Достоевский').all()
                for b in books:
                    b.year = 1900

                session.commit()
            except Exception as err:
                print(f"Не удалось удалить запись: {err}")

    def del_book(self) -> None:
        # удалить книгу
        with Session(self.eng) as session:
            try:
                book = session.query(Book).filter_by(author='Пушкин').first()
                session.delete(book)

                session.commit()
            except Exception as err:
                print(f"Не ц=удалось удалить запись: {err}")
