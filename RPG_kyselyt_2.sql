-- Assignment 3: Database queries

--Task 1 : Basic SQL queries

-- 10. Total worth of those objects that are located in forest.

select sum(worth) 
from object, tile, tiletype 
where object.tile_id = tile.id
and tile.tile_type_id = tiletype.id
and tiletype.description = "Forest";

select sum(worth) 
from tile inner join object
on object.tile_id = tile.id
inner join tiletype 
on tile.tile_type_id = tiletype.id
where tiletype.description = "Forest";

select sum(worth) 
from object
where tile_id in (
select id
from tile
where tile_type_id in (
select id
from tiletype
where tiletype.description = "Forest"));


-- 11. Description of each enemy type and number of enemies of that type (use ‘group by’).


select description, count(enemy.id)
from enemytype, enemy
where enemy.enemy_type_id = enemytype.id
group by description;

select description, count(enemy.id)
from enemy inner join enemytype
on enemy.enemy_type_id = enemytype.id
group by description;



-- 12. Description of those enemy types that have at least two enemies (use ‘having count’).

select description, count(enemy.id)
from enemytype, enemy
where enemy.enemy_type_id = enemytype.id
group by description
having count(*) >= 2; 

--having count(enemy_type_id) >= 2; 

--tässä joku virhe:
select description, count(enemy.enemy_type_id)
from enemytype inner join enemy
on enemy.enemy_type_id = enemytype.id
group by description
having count (enemy.id) >=2;


-- Task 2 : More SQL queries

-- 7. What is the average hp of those enemies?

select AVG(enemy.hp)
from player, enemy
where player.tile_id = enemy.tile_id;


-- 8. How many dragons there are in the game?


select count(enemy.id)
from enemy, enemytype
where enemy.enemy_type_id = enemytype.id
and description = "Dragon";



--Assignment 4: Database updates

-- Task 1 : Update queries

-- 1. Reduce each enemy’s hp by 10%.

update enemy
set hp = 0.9 * hp


-- 2. Due to terrible spell cast by mighty mage, terrain changes. Change all road tiles into swamp.


update tile
set tile_type_id =
(select id from tiletype where description = "Swamp")
where tile_type_id =
(select id from tiletype where description = "Road");


-- 3. Remove all the orcs from the game. 

delete from enemy
where enemy_type_id in 
(select id from enemytype where description = "orc"); 


-- 4. Change player’s location to some other tile (decide yourself).

update player
set tile_id = 3; 


-- 5. Make player owner of the shield.

update object
set owner_id =
(select id from player 
where name = "Avatar")
,tile_id = NULL 
where name = "shield"; 
 

-- 6. Drop player’s sword into whatever tile he’s currently standing on (hint: Google ‘correlated subquery’).



Update object
set owner_id = NULL
, tile_id = 
(select tile_id from player)
where object.name = "Sword";






