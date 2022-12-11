-- 1. Si vuole sapere quante volte le singole parole vengono usate in ogni luogo (città) 
-- riportandone il peso totale (di ogni singola parola, usata in quel luogo in tutti i discorsi).
select luogo.nome, parola_chiave.parola, discorso.occorrenze, parola_chiave.peso
from discorso
inner join luogo on discorso.id_luogo = luogo.id_luogo
inner join parola on parola_chiave.id_parola = discorso.id_parola;

-- 2. Data una certa parola, si vuole sapere chi l’ha usata e di quale partito è, in quale discorso ed in quale luogo.
select parola_chiave.parola, speaker.cognome, speaker.partito, discorso.data, luogo.nome
from parola_chiave
inner join discorso on parola_chiave.id_parola = discorso.id_parola
inner join speaker on speaker.id_speaker = discorso.id_speaker
inner join luogo on luogo.id_luogo = discorso.id_luogo;

-- 3. (facoltativa) Visualizzare il peso totale di ogni discorso.
select discorso.data, discorso.id, parola_chiave.parola, parola_chiave.peso
from discorso
inner join parola_chiave on parola_chiave.id_parola = discorso.id_parola
where parola_chiave.peso = ;

-- Scrivere un trigger che controlli che il peso assegnato alle parole, 
-- ogni volta che viene inserita una nuova parola, sia massimo 3 
-- (in caso contrario forzarlo a 3).

delimiter //
    create trigger peso_max
    before insert
    on parola_chiave
    for each row
    begin
    if (new.peso > 3) then
    set new.peso = 3;
    end if;
    end; //
delimiter ;
