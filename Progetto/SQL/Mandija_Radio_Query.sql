
-- 1. visualizzare il lavoratore, il mezzo di trasporto e la postazione raggiunta
select lavoratore.nome_lavoratore, lavoratore.cognome_lavoratore, trasporto.marca, trasporto.modello, postazione.nome_postazione
from interv
inner join lavoratore on lavoratore.id_lavoratore = interv.id_lavoratore
inner join trasporto on trasporto.id_trasporto = interv.id_trasporto
inner join postazione on postazione.id_postazione = interv.id_postazione
order by interv.id_postazione;

-- 2. visualizzare il cliente, la regione e la postazione adibita
select cliente.nome_cliente, regione.nome, postazione.nome_postazione
from interv
inner join cliente on cliente.id_cliente = interv.id_cliente
inner join regione on regione.id_regione = interv.id_regione
inner join postazione on postazione.id_postazione = interv.id_postazione
order by cliente.id_cliente;

-- 3. visualizzare il lavoratore, il cliente e i componenti utilizzati durante l'intervento
select lavoratore.nome_lavoratore, lavoratore.cognome_lavoratore, cliente.nome_cliente, interv.id_intervento, trasmettitore.modello as trasmettitore, modulatore.modello as modulatore, ricevitore.modello as ricevitore, antenna.modello as antenna
from interv
inner join lavoratore on interv.id_lavoratore = lavoratore.id_lavoratore
inner join cliente on interv.id_cliente = cliente.id_cliente
left join trasmettitore on interv.id_trasmettitore = trasmettitore.id_trasmettitore
left join modulatore on interv.id_modulatore = modulatore.id_modulatore
left join ricevitore on interv.id_ricevitore = ricevitore.id_ricevitore
left join antenna on interv.id_antenna = antenna.id_antenna;

-- 4. visualizzare il lavoratore, la postazione e la manutenzione effettuata
select lavoratore.nome_lavoratore, lavoratore.cognome_lavoratore, postazione.nome_postazione, manutenzione.descrizione
from interv
inner join lavoratore on interv.id_lavoratore = lavoratore.id_lavoratore
inner join postazione on interv.id_postazione = postazione.id_postazione
inner join manutenzione on interv.id_manutenzione = manutenzione.id_manutenzione;

-- 5. visualizzare il cliente, il modello e la marca del mezzo di trasporto ed infine il modello dei componenti
select interv.id_intervento, cliente.nome_cliente, trasporto.marca, trasporto.modello, trasmettitore.modello as trasmettitore, modulatore.modello as modulatore, ricevitore.modello as ricevitore, antenna.modello as antenna
from interv
left join trasmettitore on interv.id_trasmettitore = trasmettitore.id_trasmettitore
left join cliente on interv.id_cliente = cliente.id_cliente
left join trasporto on interv.id_trasporto = trasporto.id_trasporto
left join modulatore on interv.id_modulatore = modulatore.id_modulatore
left join ricevitore on interv.id_ricevitore = ricevitore.id_ricevitore
left join antenna on interv.id_antenna = antenna.id_antenna;

-- 6. visualizzare l'intervento con spesa minima e lo stipendio del lavoratore
select intervento.id_intervento, intervento.spesa, lavoratore.id_lavoratore, lavoratore.stipendio
from intervento
inner join lavoratore on intervento.id_lavoratore = lavoratore.id_lavoratore
where intervento.spesa = (
    select min(spesa)
    from intervento
);

-- 7. visualizzare la regione, il cliente e la data dell'intervento
select regione.nome, cliente.nome_cliente, intervento.data_intervento
from intervento
inner join regione on regione.id_regione = intervento.id_regione
inner join cliente on cliente.id_cliente = intervento.id_cliente
order by intervento.data_intervento;

-- 8. visualizzare gli interventi effettuati nel mese di gennaio
select intervento.id_intervento, intervento.data_intervento
from intervento
where data_intervento >= '2021-01-01' and data_intervento <= '2021-01-31';

-- 9. visualizzare il cliente, la regione, la postazione e il numero di interventi effettuati
select cliente.nome_cliente, regione.nome, postazione.id_postazione, count(postazione.id_postazione) as 'numero interventi'
from interv
inner join postazione on postazione.id_postazione = interv.id_postazione
inner join cliente on cliente.id_cliente = interv.id_cliente
inner join regione on regione.id_regione = interv.id_regione
group by postazione.id_postazione
order by postazione.id_postazione;

-- 10. visualizzare i costi di tutti gli interventi effettuati nel 2021
explain
select intervento.id_intervento, intervento.spesa, intervento.data_intervento
from intervento
where intervento.data_intervento >= '2021-01-01' 
and intervento.data_intervento <= '2021-12-31';

-- 11. calcolare il costo totale dei componenti utilizzati durante il primo intervento
select interv.id_intervento, interv.id_componenti, sum(coalesce(trasmettitore.prezzo, 0) + coalesce(modulatore.prezzo, 0) + coalesce(ricevitore.prezzo, 0) + coalesce(antenna.prezzo, 0) ) as 'costo intervento'
from interv
left join trasmettitore on trasmettitore.id_trasmettitore = interv.id_trasmettitore
left join modulatore on modulatore.id_modulatore = interv.id_modulatore
left join ricevitore on ricevitore.id_ricevitore = interv.id_ricevitore
left join antenna on antenna.id_antenna = interv.id_antenna
where interv.id_intervento = 'Itv000';

-- 12. calcolare il costo totale dei componenti utilizzati in tutte le postazioni della regione Lazio
select interv.id_intervento, regione.nome, interv.id_postazione, trasmettitore.prezzo as 'prezzo trx', modulatore.prezzo as 'prezzo mrx', ricevitore.prezzo as 'prezzo rrx', antenna.prezzo as 'prezzo ant'
from interv
left join trasmettitore on trasmettitore.id_trasmettitore = interv.id_trasmettitore
left join modulatore on modulatore.id_modulatore = interv.id_modulatore
left join ricevitore on ricevitore.id_ricevitore = interv.id_ricevitore
left join antenna on antenna.id_antenna = interv.id_antenna
inner join regione on regione.id_regione = interv.id_regione
where regione.nome = 'Lazio';

-- 13. calcolare il costo totale dei modulatori richiesti per conto del cliente Radio 105
select interv.id_intervento, cliente.nome_cliente, modulatore.modello, modulatore.prezzo
from interv
inner join modulatore on modulatore.id_modulatore = interv.id_modulatore
inner join cliente on cliente.id_cliente = interv.id_cliente
where cliente.nome_cliente = 'Radio 105';

-- 14. visualizzare quante volte è stato utilizzato lo stesso modulatore durante tutti gli interventi
select interv.id_lavoratore, interv.id_intervento, interv.id_modulatore, modulatore.modello
from interv
inner join modulatore on modulatore.id_modulatore = interv.id_modulatore
order by interv.id_modulatore;

-- 15. visualizzare i mezzi di trasporto utilizzati per raggiungere le postazioni nella regione Toscana
select trasporto.modello, regione.nome, postazione.id_postazione
from trasporto
inner join intervento on intervento.id_trasporto = trasporto.id_trasporto
inner join regione on regione.id_regione = intervento.id_regione
inner join postazione on postazione.id_regione = regione.id_regione
where regione.nome = 'Toscana';

-- 16. visualizzare il lavoratore e gli interventi effettuati per conto del cliente Virgin Radio
select lavoratore.id_lavoratore, intervento.id_intervento, cliente.nome_cliente
from lavoratore
inner join intervento on intervento.id_lavoratore = lavoratore.id_lavoratore
inner join cliente on intervento.id_cliente = cliente.id_cliente
where cliente.nome_cliente = 'Virgin Radio';

-- 17. visualizzare i componenti utilizzati nelle postazioni del cliente Radio Globo
select postazione.nome_postazione, cliente.nome_cliente, componenti.id_intervento, trasmettitore.modello, modulatore.modello, ricevitore.modello, antenna.modello
from componenti
right join trasmettitore on componenti.id_trasmettitore = trasmettitore.id_trasmettitore
right join modulatore on componenti.id_modulatore = modulatore.id_modulatore
right join ricevitore on componenti.id_ricevitore = ricevitore.id_ricevitore
right join antenna on componenti.id_antenna = antenna.id_antenna
inner join postazione on componenti.id_postazione = postazione.id_postazione
inner join cliente on postazione.id_cliente = cliente.id_cliente
where cliente.nome_cliente = 'Radio Globo';

-- 18. visualizzare tutti gli interventi in cui è stato utilizzato il trasmettitore Trsmt-TR94
select interv.id_intervento, trasmettitore.id_trasmettitore, trasmettitore.modello
from interv
inner join trasmettitore on trasmettitore.id_trasmettitore = interv.id_trasmettitore
where trasmettitore.modello = 'Trsmt-TR94';

-- 19. visualizzare tutti gli interventi in cui è stata effettuata la manutenzione nella regione Toscana
select interv.id_intervento, regione.nome, manutenzione.id_manutenzione, manutenzione.descrizione
from interv
inner join manutenzione on manutenzione.id_manutenzione = interv.id_manutenzione
inner join regione on regione.id_regione = interv.id_regione
where regione.nome = 'Campania';

-- 20. visualizzare il lavoratore e gli interventi in cui è stata sostituita l'antenna Ant-A50
select lavoratore.nome_lavoratore, lavoratore.cognome_lavoratore, interv.id_intervento, antenna.modello
from interv
inner join lavoratore on lavoratore.id_lavoratore = interv.id_lavoratore
inner join antenna on antenna.id_antenna = interv.id_antenna
where antenna.modello = 'Ant-A50';
