/* a) Si vuole sapere i calciatori da quali allenatori sono stati allenati. */
select calciatori.nome, allenatori.nome, squadra.nome
from squadra
inner join gioca on squadra.codice = gioca.codice
inner join allenamento on squadra.codice = allenamento.codice
inner join calciatori on calciatori.cf_calc = gioca.cf_calc
inner join allenatori on allenatori.cf_all = allenamento.cf_all;

/* b) Si vogliono sapere i calciatori che erano nella stessa squadra di "Pippo" nel 2016. */
select y.*
from calciatori x, calciatori y
inner join gioca g on f.cf_calc = x.cf_calc
inner join squadra s on s.codice = g.codice
where x.nome = 'Pippo' and
x.nome != y.nome and
s.anno = '2016';

/* c) Calcolare la media dei compensi di tutti i calciatori che hanno 
guadagnato più di quello che ha guadagnato "Pippo" nell’anno  2016.*/

