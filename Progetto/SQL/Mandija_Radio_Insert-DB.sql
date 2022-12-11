
insert into lavoratore
values 
('Lav000', 'Thomas', 'Mandija', 1500),
('Lav001', 'Dario', 'Lemeni', 1200),
('Lav002', 'Marco', 'Fei', 1300),
('Lav003', 'Daniele', 'Mei', 800),
('Lav004', 'Enrico', 'Giordani', 1100),
('Lav005', 'Adriano', 'Semerano', 1400),
('Lav006', 'Lorenzo', 'Rocchi', 1000),
('Lav007', 'Francesco', 'Stefani', 1000),
('Lav008', 'Adrian', 'Alexa', 1000),
('Lav009', 'Guido', 'Parlatore', 1000);

insert into cliente
values 
('Clt000', 'Radio Globo'),
('Clt001', 'Virgin Radio'),
('Clt002', 'Radio 105'),
('Clt003', 'R101'),
('Clt004', 'Rai1'),
('Clt005', 'Radio Montecarlo'),
('Clt006', 'Radio Radicale'),
('Clt007', 'RTL'),
('Clt008', 'Radio M100'),
('Clt009', 'RDS');

insert into trasporto
values 
('Trp000', 'Volkswagen', 'Crafer', 3, 27000),
('Trp001', 'Fiat', 'Doblò', 3, 20000),
('Trp002', 'Peugeot', 'Boxer', 3, 18000),
('Trp003', 'Ford', 'Transit', 3, 27000),
('Trp004', 'Dacia', 'Dokker', 2, 14000),
('Trp005', 'Citroen', 'Berlingo', 3, 15000),
('Trp006', 'Opel', 'Combo', 2, 14500),
('Trp007', 'Mercedes', 'Citan', 3, 18000),
('Trp008', 'Iveco', 'Daily furgone', 3, 35000),
('Trp009', 'Toyota', 'Proace', 3, 23000);

insert into regione
values 
('Reg000', 'Lazio', 1),
('Reg001', 'Toscana', 1),
('Reg002', 'Campania', 2),
('Reg003', 'Umbria', 1),
('Reg004', 'Basilicata', 1),
('Reg005', 'Puglia', 1),
('Reg006', 'Sicilia', 1),
('Reg007', 'Sardegna', 0),
('Reg008', 'Lombardia', 1),
('Reg009', 'Piemonte', 1);

insert into trasmettitore
values 
('Trx000', 'Trsmt-TR94', 200),
('Trx001', 'Trsmt-TR88', 100),
('Trx002', 'Trsmt-TR12', 300),
('Trx003', 'Trsmt-TR37', 900),
('Trx004', 'Trsmt-TR28', 400),
('Trx005', 'Trsmt-TR71', 500),
('Trx006', 'Trsmt-TR56', 800),
('Trx007', 'Trsmt-TR46', 700),
('Trx008', 'Trsmt-TR77', 600),
('Trx009', 'Trsmt-TR61', 1000);

insert into modulatore
values 
('Mrx000', 'Mod-M47', 200),
('Mrx001', 'Mod-M56', 200),
('Mrx002', 'Mod-M18', 200),
('Mrx003', 'Mod-M43', 150),
('Mrx004', 'Mod-M98', 150),
('Mrx005', 'Mod-M12', 150),
('Mrx006', 'Mod-M78', 500),
('Mrx007', 'Mod-M52', 300),
('Mrx008', 'Mod-M91', 100),
('Mrx009', 'Mod-M64', 700);

insert into ricevitore
values 
('Rrx000', 'Ric-R74', 200),
('Rrx001', 'Ric-R53', 200),
('Rrx002', 'Ric-R69', 200),
('Rrx003', 'Ric-R78', 450),
('Rrx004', 'Ric-R64', 900),
('Rrx005', 'Ric-R42', 300),
('Rrx006', 'Ric-R11', 300),
('Rrx007', 'Ric-R94', 600),
('Rrx008', 'Ric-R63', 600),
('Rrx009', 'Ric-R83', 600);

insert into antenna
values 
('Ant000', 'Ant-A60', 100),
('Ant001', 'Ant-A50', 500),
('Ant002', 'Ant-A80', 700),
('Ant003', 'Ant-A40', 200),
('Ant004', 'Ant-A70', 400),
('Ant005', 'Ant-A20', 600),
('Ant006', 'Ant-A10', 800),
('Ant007', 'Ant-A30', 1000),
('Ant008', 'Ant-A90', 300),
('Ant009', 'Ant-A00', 900);

insert into postazione
values 
('Pos000', 'Pos0', 'Reg000', 'Clt000'),
('Pos001', 'Pos1', 'Reg002', 'Clt002'),
('Pos002', 'Pos2', 'Reg001', 'Clt001'),
('Pos003', 'Pos3', 'Reg005', 'Clt005'),
('Pos004', 'Pos4', 'Reg004', 'Clt009'),
('Pos005', 'Pos5', 'Reg006', 'Clt004'),
('Pos006', 'Pos6', 'Reg008', 'Clt006'),
('Pos007', 'Pos7', 'Reg007', 'Clt008'),
('Pos008', 'Pos8', 'Reg009', 'Clt007'),
('Pos009', 'Pos9', 'Reg003', 'Clt003');

insert into manutenzione
values 
('Mnt000', 'Riavvio stazione'),
('Mnt001', 'Spegnimento completo, pulizia sistemi'),
('Mnt002', 'Cambio gruppo elettrogeno'),
('Mnt003', 'Controllo stato'),
('Mnt004', 'Sostituzione batterie');

insert into intervento
values 
('Itv000', 'Lav000', 'Clt000', 'Trp002', 'Reg000', 0, '2021-01-15'),
('Itv001', 'Lav002', 'Clt001', 'Trp001', 'Reg001', 0, '2021-01-16'),
('Itv002', 'Lav001', 'Clt002', 'Trp000', 'Reg002', 0, '2020-04-25'),
('Itv003', 'Lav001', 'Clt002', 'Trp001', 'Reg002', 0, '2021-08-05'),
('Itv004', 'Lav005', 'Clt006', 'Trp000', 'Reg008', 0, '2021-06-03'),
('Itv005', 'Lav008', 'Clt003', 'Trp003', 'Reg003', 0, '2020-01-08'),
('Itv006', 'Lav007', 'Clt005', 'Trp005', 'Reg005', 0, '2020-02-12'),
('Itv007', 'Lav006', 'Clt009', 'Trp007', 'Reg004', 0, '2021-05-23'),
('Itv008', 'Lav004', 'Clt004', 'Trp006', 'Reg006', 0, '2021-01-25'),
('Itv009', 'Lav009', 'Clt007', 'Trp008', 'Reg009', 0, '2021-06-01');

insert into componenti
values 
('Cmp000', 'Itv000', 'Trx000', 'Mrx001', 'Rrx002', 'Ant001', 'Pos000', NULL),
('Cmp001', 'Itv001', NULL, 'Mrx002', NULL, 'Ant002', 'Pos002', NULL),
('Cmp002', 'Itv002', NULL, NULL, NULL, NULL, 'Pos001', 'Mnt000'),
('Cmp003', 'Itv003', NULL, 'Mrx002', NULL, NULL, 'Pos001', NULL),
('Cmp004', 'Itv004', 'Trx008', 'Mrx001', 'Rrx008', 'Ant005', 'Pos006', NULL),
('Cmp005', 'Itv005', NULL, NULL, NULL, NULL, 'Pos009', 'Mnt001'),
('Cmp006', 'Itv006', NULL, NULL, NULL, NULL, 'Pos003', 'Mnt004'),
('Cmp007', 'Itv007', 'Trx003', 'Mrx006', NULL, 'Ant008', 'Pos004', NULL),
('Cmp008', 'Itv008', 'Trx007', 'Mrx006', NULL, NULL, 'Pos005', NULL),
('Cmp009', 'Itv009', 'Trx006', 'Mrx006', 'Rrx003', 'Ant006', 'Pos008', NULL);

insert into sost_trx
values 
('Trx000', 'Cmp000'),
('Trx008', 'Cmp004'),
('Trx003', 'Cmp007'),
('Trx007', 'Cmp006'),
('Trx006', 'Cmp009');

insert into sost_mrx
values 
('Mrx001', 'Cmp000'),
('Mrx002', 'Cmp001'),
('Mrx002', 'Cmp003'),
('Mrx001', 'Cmp004'),
('Mrx006', 'Cmp007'),
('Mrx006', 'Cmp008'),
('Mrx006', 'Cmp009');

insert into sost_rrx
values 
('Rrx002', 'Cmp000'),
('Rrx008', 'Cmp004'),
('Rrx003', 'Cmp009');

insert into sost_ant
values 
('Ant001', 'Cmp000'),
('Ant002', 'Cmp001'),
('Ant005', 'Cmp004'),
('Ant008', 'Cmp007'),
('Ant006', 'Cmp009');

insert into sost_mnt
values 
('Mnt000', 'Cmp002'),
('Mnt001', 'Cmp005'),
('Mnt004', 'Cmp006');

insert into esecuzione
values
('Lav000', 'Itv000'),
('Lav001', 'Itv002'),
('Lav001', 'Itv003'),
('Lav002', 'Itv001'),
('Lav004', 'Itv008'),
('Lav005', 'Itv004'),
('Lav006', 'Itv007'),
('Lav007', 'Itv006'),
('Lav008', 'Itv005'),
('Lav009', 'Itv009');

insert into richiesta
values
('Clt000', 'Itv000'),
('Clt001', 'Itv001'),
('Clt002', 'Itv002'),
('Clt002', 'Itv003'),
('Clt006', 'Itv004'),
('Clt003', 'Itv005'),
('Clt005', 'Itv006'),
('Clt009', 'Itv007'),
('Clt004', 'Itv008'),
('Clt007', 'Itv009');

insert into raggiungimento
values
('Trp002', 'Itv000'),
('Trp001', 'Itv001'),
('Trp000', 'Itv002'),
('Trp001', 'Itv003'),
('Trp000', 'Itv004'),
('Trp003', 'Itv005'),
('Trp005', 'Itv006'),
('Trp007', 'Itv007'),
('Trp006', 'Itv008'),
('Trp008', 'Itv009');

insert into esecuzione_reg
values
('Reg000', 'Itv000'),
('Reg001', 'Itv001'),
('Reg002', 'Itv002'),
('Reg002', 'Itv003'),
('Reg008', 'Itv004'),
('Reg003', 'Itv005'),
('Reg005', 'Itv006'),
('Reg004', 'Itv007'),
('Reg006', 'Itv008'),
('Reg009', 'Itv009');
