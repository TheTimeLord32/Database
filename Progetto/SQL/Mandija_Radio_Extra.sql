
-- collegamento tabella intervento e componenti
create view interv as
select intervento.* , componenti.id_componenti, componenti.id_trasmettitore, componenti.id_modulatore, componenti.id_ricevitore, componenti.id_antenna, componenti.id_postazione, componenti.id_manutenzione
from intervento
inner join componenti on intervento.id_intervento = componenti.id_intervento;

-- trigger stipendio minimo
delimiter //
    create trigger stipendio
    before insert
    on lavoratore
    for each row
    begin
        if (new.stipendio < 1000) then
        set new.stipendio = 1000;
    end if;
    end; //
delimiter ;

-- store procedure per calcolare la spesa dei componenti e salva il valore
create procedure spesa_interv (IN codice varchar(6), OUT spesa int)
select sum(coalesce(trasmettitore.prezzo, 0) + coalesce(modulatore.prezzo, 0) + coalesce(ricevitore.prezzo, 0) + coalesce(antenna.prezzo, 0) ) as 'costo intervento'
into spesa
from interv
left join trasmettitore on trasmettitore.id_trasmettitore = interv.id_trasmettitore
left join modulatore on modulatore.id_modulatore = interv.id_modulatore
left join ricevitore on ricevitore.id_ricevitore = interv.id_ricevitore
left join antenna on antenna.id_antenna = interv.id_antenna
where interv.id_intervento = codice;

create procedure up_spesa (IN codice varchar(6))
update intervento
set intervento.spesa = @spesa
where intervento.id_intervento = codice;

call spesa_interv('Itv000', @spesa);
select @spesa;

call up_spesa('Itv000');
