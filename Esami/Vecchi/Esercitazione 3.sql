/* a) In quante (NON quali) aule c’è almeno un oggetto non funzionante. */
select count(presenza.aula), materiali.stato
from presenza
inner join materiali on materiali.nome = presenza.nome
where materiali.stato = 'Non funzionante';

/* b)Selezionare tutte le aule che appartengono allo stesso 
corso di laurea a cui è affidata l’ aula 3A, 
riportando la descrizione del corso ed il suo presidente. */
select a.*, cl1.*
from aule a
inner join corso_laurea cl1, corso_laurea cl2 on a.id_corso = cl1.id_corso
where a.codice = '3A' and
where cl1.codice = cl2.codice;

/* c)Calcolare di quanti posti dispone in totale ciascun corso di laurea,  
riportandone la descrizione. */
select corso_laurea.nome, sum(aule.posti)
from aule
inner join corso_laurea on aule.id_corso = corso_laurea.id_corso
group by corso_laurea.nome;

/* 5)Enunciare e descrivere, in poche e chiare parole,  la III Forma Normale. */
