CREATE DATABASE MySQL_bd;
USE MySQL_bd;
 
#(1) tworzymy trzy tabele: osoby, ksiazki, wypozyczenia
CREATE TABLE osoby (
	Id_osoby  INT  AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nazwisko  CHAR(20)						NOT NULL,
	Imię	CHAR(20)						NOT NULL,
	Adres	CHAR(50)						NOT NULL	
);

CREATE TABLE ksiazki (
	Id_ksiazki  INT  AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Tytuł  CHAR(50)						NOT NULL,
	Autor	CHAR(50)						NOT NULL
);

CREATE TABLE wypozyczenia (
	Id_wypozyczenia  INT  AUTO_INCREMENT PRIMARY KEY NOT NULL,
	książka  INT							NOT NULL,
	osoba	INT						NOT NULL,
	data_wypożyczenia	DATE						NOT NULL	
);

#(2) wypełnić tabele danymi
INSERT INTO osoby (Nazwisko, Imię, Adres) 
VALUES ('Oleksy', 'Paweł', 'Kraków, al. Mickiewicza 11/6'),
       ('Dębowski', 'Piotr', 'Kraków, ul. Zielona 12/7'),
       ('Kulik', 'Eugeniusz', 'Wieliczka, ul. Krakowska 7'),
       ('Sikora', 'Jan', 'Kraków, ul. Tatrzańska 7/9');

INSERT INTO ksiazki (Tytuł, Autor) 
VALUES ('Analiza matem.', 'Kowalski Jan'),
       ('Rachunek prawdopod.', 'Batko Łukasz'),
       ('Fizyka dla inż.', 'Kalestyński Andrzej'),
       ('C++:wprowadzenie', 'Balcerzak Józef'),
       ('Bazy danyc:wprow.', 'Wasiak Jan');

INSERT INTO wypozyczenia (książka, osoba, data_wypożyczenia) 
VALUES (1, 1, STR_TO_DATE('2007-11-07', '%Y-%m-%d')),
       (2, 2, STR_TO_DATE('2007-12-09', '%Y-%m-%d')),
       (3, 3, STR_TO_DATE('2007-12-10', '%Y-%m-%d')),
       (2, 4, STR_TO_DATE('2008-01-04', '%Y-%m-%d')),
       (3, 2, STR_TO_DATE('2008-01-07', '%Y-%m-%d'));

# (3) Utworzyć kwerendę (złożoną): id_wypozyczenia, tytuł, autor, nazwisko, imie, data_wypozyczenia
SELECT 
    w.Id_wypozyczenia,
    k.Tytuł,
    k.Autor,
    o.Nazwisko,
    o.Imię,
    w.data_wypożyczenia
FROM 
    wypozyczenia w
JOIN 
    ksiazki k ON w.książka = k.Id_ksiazki
JOIN 
    osoby o ON w.osoba = o.Id_osoby;

# (4) Utworzyć kwerendę pokazującą listę: nazwisko, imie-liczba wypozyczonych ksiazek
