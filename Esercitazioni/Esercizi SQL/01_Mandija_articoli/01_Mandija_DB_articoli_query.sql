--prima esercitazione

/*selezionare gli autori che hanno stipendio maggiore o uguale a 2000*/
select autore, salario 
from au 
where salario>=2000;
/*selezionare gli autori che sono professori, primo modo*/
select autore 
from au 
where qualifica = 'A' || qualifica = 'O';
/*selezionare gli autori che sono professori, secondo modo*/
select autore 
from au 
inner join qu on au.qualifica = qu.qualifica 
where au.qualifica = 'A' || au.qualifica = 'O';
/*selezionare gli autori che inziano per M*/
select autore 
from au 
where autore like 'M%';
/*selezionare la sede di lavoro di Moscarini*/
select au.autore, dip.sede 
from au 
inner join dip on au.dipnum = dip.dipnum 
where autore = 'Moscarini';

--seconda esercitazione

/*selezionare la sede di lavoro di Moscarini*/
select au.autore, dip.sede 
from au 
inner join dip on au.dipnum = dip.dipnum 
where autore = 'Moscarini';
/*si vuole sapere il costo della rivista dove e' pubblicato l'articolo "Database"*/
select ar.titolo, ar.rivista, ri.costo 
from ar 
inner join ri on ar.rivista = ri.rivista 
where ar.titolo = 'Database';
/*selezionare titolo e autore, con descrizione della qualifica per chi ha scritto "Macchine e Teoria"*/
select arau.titolo, arau.autore, qu.descrizione 
from arau 
inner join au on arau.autore = au.autore 
inner join qu on qu.qualifica = au.qualifica 
where arau.titolo = 'Macchine e Teoria';
/*selezionare titolo e autore con la descrizione della qualifica, di tutti queli che hanno scritto articoli*/
select arau.titolo, arau.autore, qu.descrizione 
from arau 
inner join au on arau.autore = au.autore 
inner join qu on qu.qualifica = au.qualifica;
/*
selezionare titolo e autore con descrizione qualifica di quelli che hanno scritto articoli
riportando anche la sede dell’autore e il costo della rivista dove sono stati pubblicati (combinazione dei precedenti)
*/
select arau.titolo, arau.autore, qu.descrizione, dip.sede, ri.costo
from arau 
inner join au on arau.autore = au.autore
inner join qu on qu.qualifica = au.qualifica
inner join dip on au.dipnum = dip.dipnum
inner join ar on ar.titolo = arau.titolo
inner join ri on ar.rivista = ri.rivista;

--terza esercitazione
/*selezionare il max e min stipendio degli autori per ogni dipartimento, con la descrizione del dipartimento*/
select max(au.salario), min(au.salario), dip.nome
from au
inner join dip on au.dipnum = dip.dipnum
group by au.dipnum;

/*selezionare nomi, data, descrizione dipartimento e sede degli autori dei dipartimenti 10 e 20 ordinandoli per cognome*/
select au.autore, au.date, dip.nome, dip.sede
from au
inner join dip on au.dipnum = dip.dipnum
where dip.dipnum = 10 or dip.dipnum = 20
order by au.autore asc;

/*contare il numero di autori presenti in ogni dipartimento, suddivisi per citta di nascita*/
select dip.dipnum, au.citta, count(au.autore) as 'Num Autori'
from au
inner join dip on au.dipnum = dip.dipnum
group by dip.dipnum, au.citta
order by dip.dipnum asc;

--quarta esercitazione
/*selezionate gli autori, con la loro città di nascita e lo stipendio, che hanno lo stipendio maggiore di quello di Calzolari*/
select au.autore, au.citta, au.salario
from au
where au.salario > (select au.salario from au where au.autore = "Calzolari");

/*visualizzare gli autori che hanno la stessa qualifica di Calzolari*/
select au.autore, au.citta, au.qualifica
from au
where au.qualifica = (select au.qualifica from au where au.autore = "Calzolari");

/*visualizzare gli autori che scrivono sulle stesse riviste (non una sola) dove scrive la Moscarini*/
select arau.titolo, arau.autore, ar.rivista 
from arau 
inner join ar on arau.titolo = ar.titolo
where ar.rivista = any (select ar.rivista from arau inner join ar on arau.titolo = ar.titolo where arau.autore = 'Moscarini')
and arau.autore != 'Moscarini';

/*nome degli autori con salario massimo*/
select autore, salario 
from au
where salario >= (select max(salario) from au);

select autore, salario 
from au, (select max(salario) as maxsal from au) as MS
where salario = maxsal;

/*visualizzare, per ogni dipartimento, gli autori che prendono in ogni dipartimento
il salario massimo, riportando la descrizione del dipartimento stesso*/
select au.autore, au.salario, dip.nome
from au
inner join dip on au.dipnum = dip.dipnum
where au.salario >= any (select max(au.salario) from au group by au.dipnum);

--Enrico
select max(salario), min(salario), nome
from au, dip
where au.dipnum = dip.dipnum
group by (dip.nome);

--Francesco
select autore, au.dipnum, nome, salario 
from au, dip, (select max(salario) maxsalario, dipnum from au group by dipnum) C 
where salario=maxsalario and au.dipnum=dip.dipnum and C.dipnum=au.dipnum;

--quinta esercitazione
/*Selezionare gli autori, con i rispettivi salari, 
che prendono un salario maggiore del più alto salario del dipartimento 20*/
explain select au.autore, au.salario, dip.dipnum
from au
inner join dip on au.dipnum = dip.dipnum
where au.salario > (select max(au.salario) from au where au.dipnum = 20);

--Francesco
explain select autore, salario, dipnum
from au, (select max(salario) maxsalario from au where dipnum = 20) C 
where au.salario> maxsalario;

--sesta esercitazione
/*Si vuole sapere la sede e la media dei salari di ogni dipartimento*/
select avg(au.salario), dip.nome
from au
inner join dip on au.dipnum = dip.dipnum
group by dip.nome;

/*Visualizzare titoli e riviste, con editore, su cui si è pubblicato da una certa data ad un'altra*/
select ar.titolo, ar.rivista, ri.editore, ar.date
from ar
inner join ri on ar.rivista = ri.rivista
where ar.date between "2000-04-21" and "2000-04-28";

/*Visualizzare, per ogni nome di dipartimento, su quali riviste si è pubblicato*/
select dip.nome, ar.rivista, arau.autore, arau.titolo
from dip
inner join au on au.dipnum = dip.dipnum 
inner join arau on au.autore = arau.autore 
inner join ar on arau.titolo = ar.titolo 
inner join ri on ar.rivista = ri.rivista
order by dip.nome;

/*Contare il numero di autori afferenti ad ogni dipartimento e visualizzarne il totale*/
select dip.nome, count(au.autore)
from dip
inner join au on au.dipnum = dip.dipnum
group by dip.nome;

/*Visualizzare la media dei costi delle riviste*/
select avg(ri.costo) as 'costo medio'
from ri;
/*Calcolare lo stipendio massimo, quello minimo e la media degli stipendi degli autori*/
select max(au.salario) as 'stipendio max', min(au.salario) as 'stipendio min', avg(au.salario) as 'salario medio'
from au;

--query generiche
select * from ar;
select * from arau;
select * from au;
select * from dip;
select * from qu;
select * from ri;
