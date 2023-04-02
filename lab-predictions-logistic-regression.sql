use sakila;

SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

create or replace view february_rentals as
select f.film_id,count(r.rental_id) as f_total_rentals
from film f
inner join inventory i
on f.film_id=i.film_id
inner join rental r
on r.inventory_id=i.inventory_id
where rental_date like '2006-02-%' 
group by f.film_id
order by f.film_id;

create or replace view august_rentals as
select f.film_id,count(r.rental_id) as a_total_rentals
from film f
inner join inventory i
on f.film_id=i.film_id
inner join rental r
on r.inventory_id=i.inventory_id
where rental_date like '2005-08-%' 
group by f.film_id
order by f.film_id;

