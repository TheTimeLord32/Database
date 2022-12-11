
CREATE DATABASE impiegati;
USE impiegati;

CREATE TABLE impiegato(
    imp_num int not null primary key,
    imp_nome varchar(20) not null,
    lavoro varchar(20) not null,
    nascita datetime not null,
    salario int not null,
    dip_num int not null
);

CREATE TABLE dipartimento(
    dip_num int not null primary key,
    dip_nome varchar(20) not null, 
    localita varchar(50) not null
);

ALTER TABLE impiegato
ADD FOREIGN KEY (dip_num) REFERENCES dipartimento(dip_num);

INSERT INTO dipartimento
VALUES (10, 'Accounting', 'New York'),
(20, 'Resarch', 'Dallas'),
(30, 'Sales', 'Chicago'),
(40, 'Operations', 'Boston');

INSERT INTO impiegato
VALUES (7369, 'Smith', 'Clerck', '1980-12-17', 800, 20),
(7499, 'Allen', 'Salesman', '1981-02-20', 1600, 30),
(7521, 'Wars', 'Salesman', '1981-02-22', 1250, 30),
(7566, 'Jones', 'Manager', '1981-04-02', 2950, 20),
(7654, 'Martin', 'Salesman', '1981-09-28', 1250, 30),
(7698, 'Blake', 'Manager', '1981-05-01', 2850, 30),
(7782, 'Clarck', 'Manager', '1981-06-09', 2450, 10),
(7788, 'Scott', 'Analyst', '1981-11-09', 3000, 20),
(7839, 'King', 'President', '1981-11-17', 5000, 10),
(7844, 'Turner', 'Salesman', '1981-09-08', 1500, 30),
(7876, 'Adams', 'Clerck', '1981-09-23', 1100, 20),
(7900, 'James', 'Clerck', '1981-12-03', 950, 30),
(7902, 'Ford', 'Analyst', '1981-12-03', 3000, 20),
(7934, 'Miller', 'Clerck', '1982-01-23', 1300, 10);
