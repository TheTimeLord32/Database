CREATE DATABASE articoli;
USE articoli;

CREATE table ar(
    titolo VARCHAR(50) not null PRIMARY KEY,
    rivista VARCHAR(50) not null,
    date DATETIME not null
);

CREATE table au(
    autore VARCHAR(50) not null PRIMARY KEY,
    qualifica char(1) not null,
    citta VARCHAR(50) not null,
    date DATETIME not null, 
    dipnum int not null,
    salario int not null
);

CREATE table ri(
    rivista VARCHAR(50) not null PRIMARY KEY,
    costo int not null,
    editore VARCHAR(25) not null
);

CREATE table qu(
    qualifica char(1) not null PRIMARY KEY,
    descrizione VARCHAR(50) not null
);
CREATE table dip(
    dipnum int not null PRIMARY KEY,
    nome VARCHAR(50) not null,
    sede VARCHAR(50) not null
);

CREATE table arau(
    titolo varchar(50),
    autore VARCHAR(50),
    FOREIGN KEY (titolo) REFERENCES ar(titolo),
    FOREIGN KEY (autore) REFERENCES au(autore)
);

ALTER TABLE ar
ADD FOREIGN KEY (rivista) REFERENCES ri(rivista);

ALTER TABLE au
ADD FOREIGN KEY (qualifica) REFERENCES qu(qualifica),
ADD FOREIGN KEY (dipnum) REFERENCES dip(dipnum);

ALTER TABLE arau
ADD PRIMARY KEY (titolo, autore);

INSERT INTO ri(rivista, costo, editore) 
VALUES ('Computer Science', 30, 'BIT'),
('Le Scienze', 15, 'BIT'),
('IEEE-Review', 45, 'BOH Press');

INSERT INTO ar(titolo, rivista, date)
VALUES ('Teoria della programmazione', 'IEEE-Review', '2000-04-21'), 
('Le catene di Markov', 'Computer Science', '2000-04-21'),
('Macchine e Teoria', 'Le Scienze', '2000-04-28'),
('MySQL', 'Le Scienze', '2000-04-28'),
('I Quanti', 'IEEE-Review', '2000-04-28'),
('Database', 'Computer Science', '2000-04-28');

INSERT INTO au(autore, qualifica, citta, date, dipnum, salario)
VALUES ('Moscarini', 'A', 'Roma', '1996-05-03', 10, 3000),
('Calzolari', 'R', 'Brescia', '1998-12-01', 20, 2500),
('Gambosi', 'O', 'Roma', '2000-11-01', 30, 3000),
('Vigliano', 'D', 'Roma', '2001-03-01', 10, 1500),
('Berretti', 'R', 'Roma', '2002-10-15', 20, 2500);

INSERT INTO qu(qualifica, descrizione)
VALUES ('A', 'associato'),
('O', 'ordinario'),
('R', 'ricercatore'),
('D', 'dottorando');

INSERT INTO dip(dipnum, nome, sede)
VALUES (10, 'Matematica', 'Sogene'),
(20, 'Fisica', 'INFN'),
(30, 'Informatica', 'Sogene'),
(40, 'Specialistica', 'Nestor');

INSERT INTO arau(titolo, autore)
VALUES ('Teoria della programmazione', 'Moscarini'),
('Le catene di Markov', 'Calzolari'),
('Macchine e Teoria', 'Gambosi'),
('MySQL', 'Vigliano'),
('I Quanti', 'Berretti'),
('Database', 'Moscarini'),
('Macchine e Teoria', 'Vigliano');
