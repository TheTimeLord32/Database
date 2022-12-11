
create database radio;
use radio;

create table lavoratore(
    id_lavoratore varchar(6) not null primary key,
    nome_lavoratore varchar(50) not null,
    cognome_lavoratore varchar(50) not null,
    stipendio int not null
);

create table cliente(
    id_cliente varchar(6) not null primary key,
    nome_cliente varchar(50) not null
);

create table trasporto(
    id_trasporto varchar(6) not null primary key,
    marca varchar(50) not null,
    modello varchar(50) not null,
    posti int not null,
    prezzo int not null
);

create table regione(
    id_regione varchar(6) not null primary key,
    nome varchar(50) not null,
    num_interventi int not null    
);

create table trasmettitore(
    id_trasmettitore varchar(6) not null primary key,
    modello varchar(50) not null,
    prezzo int not null
);

create table modulatore(
    id_modulatore varchar(6) not null primary key,
    modello varchar(50) not null,
    prezzo int not null
);

create table ricevitore(
    id_ricevitore varchar(6) not null primary key,
    modello varchar(50) not null,
    prezzo int not null
);

create table antenna(
    id_antenna varchar(6) not null primary key,
    modello varchar(50) not null,
    prezzo int not null
);

create table postazione(
    id_postazione varchar(6) not null primary key,
    nome_postazione varchar(50) not null,
    id_regione varchar(6) not null references regione(id_regione) on update cascade on delete no action,
    id_cliente varchar(6) not null references cliente(id_cliente) on update cascade on delete no action
);

create table manutenzione(
    id_manutenzione varchar(6) not null primary key,
    descrizione varchar(200)
);

create table intervento(
    id_intervento varchar(6) not null primary key,
    id_lavoratore varchar(6) not null references lavoratore(id_lavoratore) on update cascade on delete no action,
    id_cliente varchar(6) not null references cliente(id_cliente) on update cascade on delete no action,
    id_trasporto varchar(6) not null references trasporto(id_trasporto) on update cascade on delete no action,
    id_regione varchar(6) not null references regione(id_regione) on update cascade on delete no action,
    spesa int not null,
    data_intervento date not null
);

create table componenti(
    id_componenti varchar(6) not null primary key,
    id_intervento varchar(6) not null references intervento(id_intervento) on update cascade on delete no action,
    id_trasmettitore varchar(6) references trasmettitore(id_trasmettitore) on update cascade on delete no action,
    id_modulatore varchar(6) references modulatore(id_modulatore) on update cascade on delete no action,
    id_ricevitore varchar(6) references ricevitore(id_ricevitore) on update cascade on delete no action,
    id_antenna varchar(6) references antenna(id_antenna) on update cascade on delete no action,
    id_postazione varchar(6)not null references postazione(id_postazione) on update cascade on delete no action,
    id_manutenzione varchar(6) references manutenzione(id_manutenzione) on update cascade on delete no action
);

create table esecuzione(
    id_lavoratore varchar(6) not null references lavoratore(id_lavoratore) on update cascade on delete no action,
    id_intervento varchar(6) not null references intervento(id_intervento) on update cascade on delete no action
);

alter table esecuzione
add primary key (id_lavoratore, id_intervento);

create table richiesta(
    id_cliente varchar(6) not null references cliente(id_cliente) on update cascade on delete no action,
    id_intervento varchar(6) not null references intervento(id_intervento) on update cascade on delete no action
);

alter table richiesta
add primary key (id_cliente, id_intervento);

create table raggiungimento(
    id_trasporto varchar(6) not null references trasporto(id_trasporto) on update cascade on delete no action,
    id_intervento varchar(6) not null references intervento(id_intervento) on update cascade on delete no action
);

alter table raggiungimento
add primary key (id_trasporto, id_intervento);

create table esecuzione_reg(
    id_regione varchar(6) not null references regione(id_regione) on update cascade on delete no action,
    id_intervento varchar(6) not null references intervento(id_intervento) on update cascade on delete no action
);

alter table esecuzione_reg
add primary key (id_regione, id_intervento);

create table sost_trx(
    id_trasmettitore varchar(6) not null references trasmettitore(id_trasmettitore) on update cascade on delete no action,
    id_componenti varchar(6) not null references componenti(id_componenti) on update cascade on delete no action
);

alter table sost_trx
add primary key (id_trasmettitore, id_componenti);

create table sost_mrx(
    id_modulatore varchar(6) not null references modulatore(id_modulatore) on update cascade on delete no action,
    id_componenti varchar(6) not null references componenti(id_componenti) on update cascade on delete no action
);

alter table sost_mrx
add primary key (id_modulatore, id_componenti);

create table sost_rrx(
    id_ricevitore varchar(6) not null references ricevitore(id_ricevitore) on update cascade on delete no action,
    id_componenti varchar(6) not null references componenti(id_componenti) on update cascade on delete no action
);

alter table sost_rrx
add primary key (id_ricevitore, id_componenti);

create table sost_ant(
    id_antenna varchar(6) not null references antenna(id_antenna) on update cascade on delete no action,
    id_componenti varchar(6) not null references componenti(id_componenti) on update cascade on delete no action
);

alter table sost_ant
add primary key (id_antenna, id_componenti);

create table sost_mnt(
    id_manutenzione varchar(6) not null references manutenzione(id_manutenzione) on update cascade on delete no action,
    id_componenti varchar(6) not null references componenti(id_componenti) on update cascade on delete no action
);

alter table sost_mnt
add primary key (id_manutenzione, id_componenti);
