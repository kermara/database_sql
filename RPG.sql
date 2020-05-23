--task 1:

drop database if exists RPG;
create database RPG;
use RPG;

--task 2:

create table TileType(
id int not null auto_increment,
movement_diff int,
combat_diff int,
description varchar (40), 
primary key (id)
);

create table Tile(
id int not null auto_increment,
tile_type_id int,
x_coordinate int,
y_coordinate int, 
primary key (id),
foreign key (tile_type_id) references TileType (id)
);

create table Player(
id int not null auto_increment,
name varchar (40),
level int,
hp int,
wealth int,
tile_id int, 
primary key (id),
foreign key (tile_id) references Tile (id)
);

create table EnemyType (
id int not null auto_increment,
attack_value int ,
def_value int,
initial_hp int,
description varchar (40),
primary key (id)
);

create table Enemy (
id int not null auto_increment,
name varchar (40),
hp int,
tile_id int,
enemy_type_id int, 
primary key (id),
foreign key (tile_id) references Tile (id),
foreign key (enemy_type_id) references EnemyType (id)
);

create table Object (
id int not null auto_increment,
name varchar (40),
owner_id int,
tile_id int,
attack_value int,
def_value int,
worth int,
primary key (id),
foreign key (owner_id) references Player (id),
foreign key (tile_id) references Tile (id)
);

--task 3:

insert into TileType (movement_diff, combat_diff, description)
values (5,8, "Forest"), (13,11, "Mountain"), (2,3,"Road");

insert into Tile (tile_type_id, x_coordinate, y_coordinate)
values (2,0,0), (2,1,0), (1,2,0);

insert into Player (name, level, hp, wealth,tile_id)
values ("avatar",10,1000,100000,1);

insert into EnemyType (attack_value, def_value, initial_hp, description)
values (5,4,100,"orc"), (55,40,1000,"dragon"),(3,2,50,"goblin");

insert into Enemy (name, hp, tile_id, enemy_type_id)
values ("Foxy",37,1,3), ("Azog", 80,2,1), ("Grr",100,1,1);

insert into Object (name, owner_id, tile_id, attack_value,def_value, worth)
values ("sword",1,NULL,100,50,25), ("shield", NULL, 2,10,100,12), ("book", NULL, 3,1,1,1000);

insert into Tile (tile_type_id, x_coordinate, y_coordinate)
values (2,0,0), (2,1,0), (1,2,0);

--task 4:

insert into TileType (movement_diff, combat_diff, description)
values (12,11, "Swamp");

insert into Tile (tile_type_id, x_coordinate, y_coordinate)
values (1,3,0), (2,0,1), (1,1,1), (1,2,1),(4,3,1),(2,0,2),(3,1,2),(3,2,2),(1,3,2);

insert into Enemy (name, hp, tile_id, enemy_type_id)
values ("Xodor",50,4,2);

insert into Object (name, owner_id, tile_id, attack_value,def_value, worth)
values ("magic_scroll",1,NULL,150,75,15);




