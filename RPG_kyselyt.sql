-- TASK 1 Basic SQL queries (1-9)

-- 1. All data from player table.

select * from player;

-- 2. Description, attack value, and defense value of each enemy type.

select description, attack_value, def_value
from enemytype;

-- 3. Description of each tile type, in alphabetical order.

select description
from tiletype;

-- 4. Description of those tile types whose combat difficulty is 5 or greater.

select description
from tiletype
where combat_diff > 5;

--5. ID and enemy type description for enemies that are in bad shape (hp of 50 or less).

select enemy.id, description
from enemy, enemytype
where enemy.id = enemytype.id
and hp <= 50;

/*
tai
select enemy.id, description
from enemy inner join enemytype 
on enemy.id = enemytype.id
where hp <= 50;
*/



-- 6. Coordinates and movement difficulty for each tile.

select x_coordinate, y_coordinate, movement_diff
from Tile, tiletype
where tile.tile_type_id = tiletype.id;

-- 7. Description of objects held by player.

select player.name, object.name
from object, player
where player.id = object.owner_id;
/*
tai
select name
from object
where owner_id is not null;
*/

-- 8. Number of enemies.

select count(*) from enemy;

/*
select count(enemy.id) from enemy;
*/

--9. Number of road tiles.

select count(tile_type_id) as num
from tile, tiletype
where tile.tile_type_id = tiletype.id
and description = "Road";



--Task 2 : More SQL queries(1-6)

-- 1. What are the x and y coordinates of the tile player is located in?

Select x_coordinate, y_coordinate
from player, tile
where player.tile_id = tile.id;
 
-- 2. What is the type of the tile the player is located in?

select name, description
from player, tile, tiletype
where player.tile_id = tile.id
and tile.tile_type_id = tiletype.id;

/*
tai inner join
select tiletype.description
from player inner join tile
on player.tile_id = tile.id
inner join tiletype
on tiletype.id = tile.tile_type_id;
*/

-- 3. How difficult it is to move on player’s current tile?

select name, description, movement_diff
from player, tile, tiletype
where player.tile_id = tile.id
and tile.tile_type_id = tiletype.id;

/*
tai inner join
select movement_diff
from player inner join tile
on player.tile_id = tile.id
inner join tiletype 
on tiletype.id = tile.tile_type_id;
*/

-- 4. Which objects are owned by the player?

select player.name, object.name
from player, object
where player.id = object.owner_id;

/*
tai open versio
select object.name
from object
where object.owner_id is not null;
*/

-- 5. What are the x and y coordinates of game objects?

select x_coordinate, y_coordinate
from object, tile
where object.tile_id = tile.id;


-- 6. What enemies are located in the same tile as player?

select enemy.name
from player, enemy, tile
where player.tile_id = tile.id
and enemy.tile_id = tile.id
and player.tile_id = enemy.tile_id;




