drop database if exists ankkalinna;
create database ankkalinna;
use ankkalinna;

create table ankkalinnalainen (
id int not null auto_increment,
etunimi varchar(40),
sukunimi varchar(40),
primary key (id)
);

-- show tables; 
-- desc ankkalinnalainen; näyttää otsikot
-- select * from ankkalinnalainen näyttää taulun tiedot
-- delete from ankkalinnalainen where id=2; poistaa rivin
-- insert into ankkalinnalainen (etunimi,sukunimi) values ("Iines", "Ankka"); lisää arvoja tietokantaan 

create table lemmikki (
id int not null auto_increment,
nimi varchar (40),
primary key (id)
);

create table ankkalinnaLemmikit (
id int not null auto_increment,
omistaja_id int,
lemmikki_id int,
primary key (id), 
foreign key (omistaja_id) references ankkalinnalainen (id),
foreign key (lemmikki_id) references lemmikki (id)
);

insert into ankkalinnalainen (etunimi, sukunimi)
values ("Aku", "Ankka"), ("Roope", "Ankka"), ("Tupu", "Ankka"), ("Milla", "Magia");

insert into lemmikki (nimi)
values ("Pulivari"), ("Korri");

insert into ankkalinnaLemmikit(omistaja_id, lemmikki_id)
values (1,1),(3,1),(4,2);