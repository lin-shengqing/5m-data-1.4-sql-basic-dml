--Q1 Select the minimum and maximum price per sqm of all the flats.
SELECT  floor_area_sqm,  MIN(resale_price) AS minimum_price_per_sqm,  MAX(resale_price) AS maximum_price_per_sqm
FROM "unit-1-4".main.resale_flat_prices_2017
GROUP by floor_area_sqm
ORDER by floor_area_sqm;

--Q2 Select the average price per sqm for flats in each town.
SELECT  town,  AVG(floor_area_sqm) AS average_price_per_sqm
FROM "unit-1-4".main.resale_flat_prices_2017
GROUP by town
ORDER by town;

--Q3 Categorize flats into price ranges and count how many flats fall into each category:
--      Under $400,000: 'Budget'
--      $400,000 to $700,000: 'Mid-Range'
--      Above $700,000: 'Premium' Show the counts in descending order.
SELECT COUNT(*) AS number_of_flats,
CASE WHEN resale_price > 700000 THEN 'Premium' 
	WHEN resale_price > 400000 THEN 'Mid-Range' 
	ELSE 'Budget' 
END AS price_category
FROM resale_flat_prices_2017
GROUP BY price_category
ORDER BY number_of_flats DESC;


--Q4 Count the number of flats sold in each town during the first quarter of 2017 (January to March).
SELECT COUNT(*) AS number_of_flats_sold, town
FROM "unit-1-4".main.resale_flat_prices_2017
WHERE "month" BETWEEN '2017-01' AND  '2017-03'
GROUP BY town
ORDER BY town;
