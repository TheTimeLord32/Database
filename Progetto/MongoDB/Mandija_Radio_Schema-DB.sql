-- 1. scelta tabelle SQL

create database radio2;
use radio2;

create table lavoratoreMongoDB(
    id_lavoratore varchar(9) not null primary key,
    nome_lavoratore varchar(50) not null,
    cognome_lavoratore varchar(50) not null
);

create table clienteMongoDB(
    id_cliente varchar(9) not null primary key,
    nome_cliente varchar(50) not null
);

create table trasportoMongoDB(
    id_trasporto varchar(9) not null primary key,
    marca varchar(50) not null,
    modello varchar(50) not null
);

create table regioneMongoDB(
    id_regione varchar(9) not null primary key,
    nome_regione varchar(50) not null   
);

create table interventoMongoDB(
    id_intervento varchar(9) not null primary key,
    id_lavoratore varchar(9) not null references lavoratore(id_lavoratore) on update cascade on delete no action,
    id_cliente varchar(9) not null references cliente(id_cliente) on update cascade on delete no action,
    id_trasporto varchar(9) not null references trasporto(id_trasporto) on update cascade on delete no action,
    id_regione varchar(9) not null references regione(id_regione) on update cascade on delete no action
);

-- 2. inserimento 200000 valori casuali

source "C:/Users/Thomas/Documents/Uni-TorVergata/Anno 20-21/Dispense/Basi di Dati e di Conoscenza/Progetto/MongoDB/File SQL 200k/Mandija_Lavoratore_200k.sql"
source "C:/Users/Thomas/Documents/Uni-TorVergata/Anno 20-21/Dispense/Basi di Dati e di Conoscenza/Progetto/MongoDB/File SQL 200k/Mandija_Cliente_200k.sql"
source "C:/Users/Thomas/Documents/Uni-TorVergata/Anno 20-21/Dispense/Basi di Dati e di Conoscenza/Progetto/MongoDB/File SQL 200k/Mandija_Trasporto_200k.sql"
source "C:/Users/Thomas/Documents/Uni-TorVergata/Anno 20-21/Dispense/Basi di Dati e di Conoscenza/Progetto/MongoDB/File SQL 200k/Mandija_Regione_200k.sql"
source "C:/Users/Thomas/Documents/Uni-TorVergata/Anno 20-21/Dispense/Basi di Dati e di Conoscenza/Progetto/MongoDB/File SQL 200k/Mandija_Intervento_200k.sql"

-- 3. creazione viste tabelle

create view lavoratore as
select *
from lavoratoreMongoDB;

create view cliente as
select *
from clienteMongoDB;

create view trasporto as
select *
from trasportoMongoDB;

create view regione as
select *
from regioneMongoDB;

create view intervento as
select * 
from interventoMongoDB;

-- 4. creazione oggetto json

select json_object("id_lavoratore", id_lavoratore, "nome_lavoratore", nome_lavoratore, "cognome_lavoratore", cognome_lavoratore)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mandija_Lavoratore_MongoDB.json'
from lavoratoreMongoDB;

select json_object("id_cliente", id_cliente, "nome_cliente", nome_cliente)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mandija_Cliente_MongoDB.json'
from clienteMongoDB;

select json_object("id_trasporto", id_trasporto, "marca", marca, "modello", modello)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mandija_Trasporto_MongoDB.json'
from trasportoMongoDB;

select json_object("id_regione", id_regione, "nome_regione", nome_regione)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mandija_Regione_MongoDB.json'
from regioneMongoDB;

select json_object("id_intervento", id_intervento, "id_lavoratore", id_lavoratore, "id_cliente", id_cliente, "id_trasporto", id_trasporto, "id_regione", id_regione)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mandija_Intervento_MongoDB.json'
from interventoMongoDB;

select cliente.nome_cliente
from cliente
where cliente.nome_cliente = 'Nome-Cliente056910';
