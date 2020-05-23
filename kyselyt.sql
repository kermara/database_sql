--YHDESTÄ TAULUSTA
select etunimi 
from ankkalinnalainen
where id > 2;

select id
from ankkalinnalainen
where etunimi = "Aku" and sukunimi = "Ankka";

select etunimi, sukunimi
from ankkalinnalainen
where sukunimi like "A%";

select etunimi, sukunimi
from ankkalinnalainen
where sukunimi like "%G%";

-- !=not ei kuulu joukkoon

select etunimi
from ankkalinnalainen
order by etunimi;

select etunimi
from ankkalinnalainen
order by etunimi desc;

select etunimi, sukunimi
from ankkalinnalainen
order by sukunimi, etunimi;

--KAHDESTA TAULUSTA

select etunimi, sukunimi
from ankkalinnalainen, ankkalinnaLemmikit
where ankkalinnalainen.id = ankkalinnaLemmikit.omistaja_id
and lemmikki_id = 1;

select etunimi, sukunimi, lemmikki_id
from ankkalinnalainen, ankkalinnaLemmikit
where ankkalinnalainen.id = ankkalinnaLemmikit.omistaja_id;

-- KOLMESTA TAULUSTA
-- jos kahdessa taulussa sama nimi, pitää sanoa myös kenttä

select etunimi, sukunimi, nimi 
from ankkalinnalainen, ankkalinnaLemmikit, lemmikki
where ankkalinnalainen.id = ankkalinnaLemmikit.omistaja_id 
and lemmikki.id = ankkalinnaLemmikit.lemmikki_id;

-- INNER JOIN Tenttiin!!

select etunimi, sukunimi
from ankkalinnalainen inner join ankkalinnaLemmikit
on ankkalinnalainen.id = ankkalinnaLemmikit.omistaja_id
where lemmikki_id = 1; 

select etunimi, sukunimi, lemmikki_id
from ankkalinnalainen inner join ankkalinnaLemmikit
on ankkalinnalainen.id = ankkalinnaLemmikit.omistaja_id; 

--LEFT AND RIGHT (OUTER) JOIN

select etunimi, sukunimi, lemmikki_id
from ankkalinnalainen left join ankkalinnaLemmikit
on ankkalinnalainen.id = ankkalinnaLemmikit.id;

select etunimi, sukunimi, lemmikki_id
from ankkalinnalainen right join ankkalinnaLemmikit
on ankkalinnalainen.id = ankkalinnaLemmikit.id;

select etunimi, sukunimi, lemmikki_id
from ankkalinnaLemmikit right join ankkalinnalainen
on ankkalinnalainen.id = ankkalinnaLemmikit.id;

-- ALIAS

select etunimi, sukunimi, lemmikki_id
from ankkalinnalainen as a, ankkalinnaLemmikit as al
where a.id = al.omistaja_id;

-- DISTINCT

Select distinct sukunimi
from ankkalinnalainen;

-- GROUP BY

--sukunimi pitää olla selectissä mukana

Select sukunimi
from ankkalinnalainen
group by sukunimi;

-- COUNT

select sukunimi, count(*)
from ankkalinnalainen
group by sukunimi;

--HAVING COUNT

Select sukunimi, count(*)
from ankkalinnalainen
group by sukunimi
having count(*) >=2; 

--SUBQUERIES eli sisäkyselyt tenttiin!! (kalvo  sivu 58)
--Lemmikki id 1:n omistajien etunimi ja sukunimi

select etunimi, sukunimi
from ankkalinnalainen
where id in
(select omistaja_id
from ankkalinnaLemmikit
where lemmikki_id = 1);

--  Lemmikki Pulivarin omistajien etunimi ja sukunimi

select etunimi, sukunimi
from ankkalinnalainen
where id in
(select omistaja_id
from ankkalinnaLemmikit
where lemmikki_id in
(select id 
from lemmikki
where nimi = "Pulivari"));

-- UPDATE

update ankkalinnalainen
set sukunimi = "Setä"
where etunimi = "Roope";

-- DELETE

update tiletype
set description = "Forest"
where id = "1";

sle
delete from tiletype
where id = 5; delete from ankkalinnalainen
where 

update Enemy
set enemy_type_id = 1
where id = 2;

update object 
set owner_id = null
where id = 2; 


