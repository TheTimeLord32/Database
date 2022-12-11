
create database ricerca;
use ricerca;

create table scoperta(
    codice_scoperta varchar(6) not null primary key,
    descrizione varchar(50) not null,
    peso int not null
);

create table ricercatore(
    codice_ricercatore varchar(6) not null primary key,
    nome varchar (50) not null,
    cognome varchar (50) not null
);

create table studiare(
    codice_scoperta varchar(6) not null references scoperta(codice_scoperta) on update cascade on delete no action,
    codice_ricercatore varchar (6) not null references ricercatore(codice_ricercatore) on update cascade on delete no action
);

create table trovare(
    codice_scoperta varchar(6) not null references scoperta(codice_scoperta) on update cascade on delete no action,
    codice_ricercatore varchar (6) not null references ricercatore(codice_ricercatore) on update cascade on delete no action
);

create table scaturire(
    codice_scoperta varchar(6) not null references scoperta(codice_scoperta) on update cascade on delete no action,
    codice_scaturita varchar(6) not null
);

insert into scoperta values
('Scp001', 'Teoria Master', 100),
('Scp002', 'Teoria Stringhe', 20),
('Scp003', 'Teoria Fotoni', 20),
('Scp004', 'Teoria Laser', 20);

insert into ricercatore values
('Ric001', 'Cooper', 'Sheldon'),
('Ric002', 'Hoffstadder', 'Leonard'),
('Ric003', 'Wolowitz', 'Howard'),
('Ric004', 'Kootraphali', 'Rajesh');

insert into studiare values
('Scp001', 'Ric001'),
('Scp002', 'Ric001'),
('Scp003', 'Ric002'),
('Scp004', 'Ric003');

insert into trovare values
('Scp001', 'Ric001'),
('Scp002', 'Ric001'),
('Scp003', 'Ric003'),
('Scp004', 'Ric004');

insert into scaturire values
('Scp004', 'Scp003'),
('Scp004', 'Scp002');

/* Data una certa scoperta (codice "001") si vuole sapere la descrizione 
delle scoperte derivate da essa e i loro relativi scopritori */
----------------------------------------------------------------------------
select scaturire.codice_scaturita as 'codice scoperta originale', scoperta.codice_scoperta as 'codice scoperta derivata', 
scoperta.descrizione, ricercatore.cognome, ricercatore.nome
from scoperta 
inner join scaturire on scoperta.codice_scoperta = scaturire.codice_scoperta
inner join trovare on scoperta.codice_scoperta = trovare.codice_scoperta
inner join ricercatore on trovare.codice_ricercatore = ricercatore.codice_ricercatore
where scaturire.codice_scaturita = 'Scp002';

select scaturire.codice_scaturita as 'codice scoperta originale', scoperta.codice_scoperta as 'codice scoperta derivata', 
scoperta.descrizione, ricercatore.cognome, ricercatore.nome
from scoperta 
inner join scaturire on scoperta.codice_scoperta = scaturire.codice_scoperta
inner join trovare on scoperta.codice_scoperta = trovare.codice_scoperta
inner join ricercatore on trovare.codice_ricercatore = ricercatore.codice_ricercatore
where scoperta.codice_scoperta = 'Scp004';

/* Visualizzare, in ordine decrescente, il totale dei pesi/voti 
delle scoperte scientifiche di ogni scopritore, e il ricercatore stesso */
----------------------------------------------------------------------------
select sum(scoperta.peso) as 'peso scoperte', ricercatore.cognome
from scoperta
inner join trovare on scoperta.codice_scoperta = trovare.codice_scoperta
inner join ricercatore on ricercatore.codice_ricercatore = trovare.codice_ricercatore
group by ricercatore.cognome
order by scoperta.peso desc;
