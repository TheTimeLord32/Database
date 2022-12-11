/* 1. Calcolare la media dei voti base di tutti i laureandi di ogni 
seduta di laurea riportando inoltre il cognome del Presidente e 
l’aula in cui si tiene la seduta; */
select avg(studente.voto), docente.cognome, seduta.aula
from studente
inner join relaziona on studente.cognome = relaziona.cognome
inner join docente on docente.matricola = relaziona.matricola
inner join assegnazione on docente.matricola = assegnazione.matricola
inner join seduta on seduta.id = assegnazione.id
where seduta.presidente = docente.matricola
group by docente.cognome;

/* 2. Selezionare tutti i docenti che sono nella stessa commissione di "Vigliano" (docente) 
con l’aula di riferimento; */
select y.*, s.aula
from docente x, docente y
inner join assegnazione a on a.matricola = x.matricola
inner join seduta s on s.id = a.id
where x.cognome = 'Vigliano' and
x.matricola != y.matricola;

select y.*
from docente x, docente y
where x.cognome = 'Vigliano' and
x.matricola != y.matricola;

/* 3. Selezionare tutti gli studenti che sono nella stessa seduta di laurea 
dello studente "Pippo", riportando per ognuno i rispettivi relatori di tesi */
select y.*
from studente x, studente y
where x.nome = 'Pippo' and
x.cognome != y.cognome;
