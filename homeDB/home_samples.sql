USE new_home;

SELECT 
	a.id AS apart_id,
	a.floor,
	a.rooms,
	houses.name AS house_name,
	rent_prices.price AS rent_price
FROM apartments a
	JOIN houses ON a.house_id = houses.id
	JOIN rent_prices ON a.id = rent_prices.apart_id
WHERE a.status = 'rent';

SELECT 
	a.id AS apart_id,
	media.filename,
	photos.id AS photo
FROM apartments a 
	JOIN media ON a.id = media.apart_id
	JOIN photos ON media.id = photos.media_id
WHERE a.id = 1;

SELECT 
	a.id AS apart_id,
	media.filename,
	plans_albums.name AS plan_album,
	plans.id AS plan
FROM apartments a 
	JOIN media ON a.id = media.apart_id
	JOIN plans ON media.id = plans.media_id
	JOIN plans_albums ON a.id = plans_albums.apart_id
WHERE a.id = 2;

SELECT 
	concat(c.firstname, ' ', c.surname,' ', c.lastname) AS client,
	o.apart_id,
	o.requested_at,
	o.confirmed_at,
	o.status,
	o.total,
	d.discount,
	d.started_at,
	d.finished_at
FROM orders o
	JOIN clients c ON o.client_id = c.id 
	JOIN discounts d ON o.apart_id = d.apart_id 
WHERE o.status = 'requested';