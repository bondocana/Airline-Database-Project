create table companie(
id_companie int not null primary key,
nume varchar(50) not null,
email varchar(50));

create table avion(
id_avion int not null primary key,
id_companie int not null,
model varchar(50),
foreign key(id_companie) references companie(id_companie));

create table zbor(
id_zbor int not null primary key,
id_avion int not null,
data_decolare date not null,
ora_decolare varchar(5) not null,
data_aterizare date not null,
ora_aterizare varchar(5) not null,
plecare varchar(50) not null,
sosire varchar(50) not null,
foreign key(id_avion) references avion(id_avion));


create table pilot(
id_pilot int not null primary key,
id_zbor int not null,
nume varchar(50) not null,
prenume varchar(50) not null,
nr_telefon varchar(10),
nr_zboruri int,
foreign key(id_zbor) references zbor(id_zbor));

create table pasager(
id_pasager int not null primary key,
nume varchar(50),
prenume varchar(50),
nr_telefon varchar(10));

create table bilet(
id_bilet int not null primary key,
id_pasager int not null,
id_zbor int not null,
plecare varchar(50) not null,
sosire varchar(50) not null,
foreign key(id_pasager) references pasager(id_pasager),
foreign key(id_zbor) references zbor(id_zbor));

create table boardingpass(
id_boardingpass int not null primary key,
id_zbor int not null,
id_pasager int not null,
id_bilet int not null,
poarta int not null,
foreign key(id_zbor) references zbor(id_zbor),
foreign key(id_pasager) references pasager(id_pasager),
foreign key(id_bilet) references bilet(id_bilet));

create table ruta(
id_companie int not null,
id_zbor int not null,
plecare varchar(50),
sosire varchar(50),
constraint id_ruta primary key(id_companie, id_zbor));

alter table ruta add foreign key(id_companie) references companie(id_companie);
alter table ruta add foreign key(id_zbor) references zbor(id_zbor);

insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'WizzAir', 'wizzair@gmail.com');
insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'RyanAir', 'ryanair@gmail.com');
insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'BlueAir', 'blueair@gmail.com');
insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'Delta', 'delta@gmail.com');
insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'Lufthansa', 'lufthansa@gmail.com');
insert into companie(id_companie, nume, email)
values
(seq_companie.nextval, 'Tarom', NULL);

insert into avion(id_avion, id_companie, model)
values
(200, 100, 'Airbus A300');
insert into avion(id_avion, id_companie, model)
values
(201, 101, 'Airbus A321');
insert into avion(id_avion, id_companie, model)
values
(202, 102, 'Antonov An-26');
insert into avion(id_avion, id_companie, model)
values
(203, 103, 'Boeing 747');
insert into avion(id_avion, id_companie, model)
values
(204, 104, 'F6F Hellcat');


insert into zbor(id_zbor, id_avion, data_decolare, ora_decolare, data_aterizare, ora_aterizare, plecare, sosire)
values
(10, 200, to_date('06/15/2020', 'MM/DD/RRRR'), '10:00', to_date('06/15/2020', 'MM/DD/RRRR'), '13:45', 'Bucuresti', 'Paris');
insert into zbor(id_zbor, id_avion, data_decolare, ora_decolare, data_aterizare, ora_aterizare, plecare, sosire)
values
(11, 201, to_date('12/02/2020', 'MM/DD/RRRR'), '23:15', to_date('12/03/2020', 'MM/DD/RRRR'), '03:00', 'Amsterdam', 'Barcelona');
insert into zbor(id_zbor, id_avion, data_decolare, ora_decolare, data_aterizare, ora_aterizare, plecare, sosire)
values
(12, 202, to_date('05/23/2020', 'MM/DD/RRRR'), '14:05', to_date('05/23/2020', 'MM/DD/RRRR'), '16:45', 'Praga', 'Londra');
insert into zbor(id_zbor, id_avion, data_decolare, ora_decolare, data_aterizare, ora_aterizare, plecare, sosire)
values
(13, 203, to_date('01/20/2020', 'MM/DD/RRRR'), '12:55', to_date('01/20/2020', 'MM/DD/RRRR'), '17:05', 'Madrid', 'Bucuresti');
insert into zbor(id_zbor, id_avion, data_decolare, ora_decolare, data_aterizare, ora_aterizare, plecare, sosire)
values
(14, 204, to_date('06/15/2020', 'MM/DD/RRRR'), '05:00', to_date('06/15/2020', 'MM/DD/RRRR'), '07:35', 'Frankfurt', 'Sibiu');

insert into pilot(id_pilot, id_zbor, nume, prenume, nr_telefon, nr_zboruri)
values
(1, 10, 'Bondoc', 'Constantin', '0754255678', 123);
insert into pilot(id_pilot, id_zbor, nume, prenume, nr_telefon, nr_zboruri)
values
(2, 11, 'Popescu', 'Mihai', '0742697412', 345);
insert into pilot(id_pilot, id_zbor, nume, prenume, nr_telefon, nr_zboruri)
values
(3, 12, 'Diaconescu', 'Denis', '0766542274', 679);
insert into pilot(id_pilot, id_zbor, nume, prenume, nr_telefon, nr_zboruri)
values
(4, 13, 'Nastasoiu', 'Vasile', '0751004735', 512);
insert into pilot(id_pilot, id_zbor, nume, prenume, nr_telefon, nr_zboruri)
values
(5, 14, 'Petrescu', 'Alexandru', '0785421119', 289);

insert into pasager(id_pasager, nume, prenume, nr_telefon)
values
(seq_pasager.nextval, 'Popa', 'Marisa', '0754554123');
insert into pasager(id_pasager, nume, prenume, nr_telefon)
values
(seq_pasager.nextval, 'Dumitrescu', 'Anais', '0745200014');
insert into pasager(id_pasager, nume, prenume, nr_telefon)
values
(seq_pasager.nextval, 'Anghelescu', 'Mihail', '0742100667');
insert into pasager(id_pasager, nume, prenume, nr_telefon)
values
(seq_pasager.nextval, 'Barbu', 'Robert', '0798745612');
insert into pasager(id_pasager, nume, prenume, nr_telefon)
values
(seq_pasager.nextval, 'Gaman', 'Andrei', '0755244863');

insert into bilet(id_bilet, id_pasager, id_zbor, plecare, sosire)
values
(400, 300, 10, 'Bucuresti', 'Paris');
insert into bilet(id_bilet, id_pasager, id_zbor, plecare, sosire)
values
(401, 301, 11, 'Amsterdam', 'Barcelona');
insert into bilet(id_bilet, id_pasager, id_zbor, plecare, sosire)
values
(402, 302, 12, 'Praga', 'Londra');
insert into bilet(id_bilet, id_pasager, id_zbor, plecare, sosire)
values
(403, 303, 13, 'Madrid', 'Bucuresti');
insert into bilet(id_bilet, id_pasager, id_zbor, plecare, sosire)
values
(404, 304, 14, 'Frankfurt', 'Sibiu');

insert into boardingpass(id_boardingpass, id_zbor, id_pasager, id_bilet, poarta)
values
(500, 10, 300, 400, 7);
insert into boardingpass(id_boardingpass, id_zbor, id_pasager, id_bilet, poarta)
values
(501, 11, 301, 401, 9);
insert into boardingpass(id_boardingpass, id_zbor, id_pasager, id_bilet, poarta)
values
(502, 12, 302, 402, 4);
insert into boardingpass(id_boardingpass, id_zbor, id_pasager, id_bilet, poarta)
values
(503, 13, 303, 403, 11);
insert into boardingpass(id_boardingpass, id_zbor, id_pasager, id_bilet, poarta)
values
(504, 14, 304, 404, 14);

insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(100, 10, 'Bucuresti', 'Paris');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(101, 11, 'Amsterdam', 'Barcelona');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(102, 12, 'Praga', 'Londra');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(103, 13, 'Madrid', 'Bucuresti');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(104, 14, 'Frankfurt', 'Sibiu');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(100, 14, 'Viena', 'Moscova');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(101, 13, 'Londra', 'Bucuresti');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(102, 11, 'Berlin', 'Paris');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(103, 12, 'Roma', 'Atena');
insert into ruta(id_companie, id_zbor, plecare, sosire)
values
(104, 10, 'Bucuresti', 'Napoli');
