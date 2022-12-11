CREATE DATABASE film;
USE film;

CREATE TABLE dvd(
    posizione VARCHAR(50) not null,
    film varchar(50) not null
);

CREATE TABLE film(
    id_film varchar(5) not null PRIMARY key,
    titolo varchar(50) not null,
    anno date not null,
    nazionalita varchar(50) not null,
    lingua varchar(50) not null,
    regista varchar(50) not null
);

CREATE TABLE attori(
    id_attori varchar(5) not null PRIMARY KEY,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    data date not null,
    nascita varchar(50) not null
);

CREATE TABLE regista(
    id_regista varchar(5) not null PRIMARY KEY,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    data date not null,
    nascita varchar(50) not null
);

CREATE TABLE contratto(
    id_contratto varchar(5) not null PRIMARY KEY,
    film varchar(5) not null,
    attori varchar(5) not null
);

ALTER TABLE dvd
ADD FOREIGN KEY (film) REFERENCES film(id_film);

ALTER TABLE film
ADD FOREIGN KEY (attori) REFERENCES attori(id_attori),
ADD FOREIGN KEY (regista) REFERENCES regista(id_regista);

ALTER TABLE contratto
ADD FOREIGN KEY (film) REFERENCES film(id_film),
ADD FOREIGN KEY (attori) REFERENCES attori(id_attori);

INSERT INTO attori(id_attori, nome, cognome, data, nascita)
VALUES ('AA00', 'Daniel', 'Radcliffe', '1989-07-23', 'Londra'),
('AA01', 'Rupert', 'Grint', '1988-08-24', 'Harlow'),
('AA02', 'Emma', 'Watson', '1990-04-15', 'Parigi');

INSERT INTO regista(id_regista, nome, cognome, data, nascita)
VALUES ('RR00', 'Chis', 'Colombus', '1958-09-10', 'Sprangler');

INSERT INTO film(id_film, titolo, anno, nazionalita, lingua, regista)
VALUES ('FF01', 'Harry Potter 1', '2001-01-01', 'Inglese', 'Inglese', 'RR00');

INSERT INTO dvd(posizione, film)
VALUES ('Scaffale', 'FF00');

INSERT INTO contratto(id_contratto, film, attori)
VALUES ('CC00', 'FF01', 'AA00'),
('CC01', 'FF01', 'AA01'),
('CC02', 'FF01', 'AA02');

--sql
select dvd.posizione, film.titolo
from dvd, film;

select dvd.posizione, film.titolo
from dvd
inner join film on dvd.film = film.id_film;


