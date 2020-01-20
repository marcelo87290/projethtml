
use junkfood;
select count(*) from restaurants
inner join postes
on restaurants.id = postes.resto_id and postes.en_cours =1
where left(code_postal,2) in ('64'); 

#---2 Exo
USE JunkFood;

CREATE OR REPLACE TABLE temp AS
SELECT pays_id, ing_id, sum(unites) AS Tot_ing FROM Cartes
JOIN Recettes
ON Cartes.item_id = Recettes.item_id
GROUP BY pays_id, ing_id;

CREATE OR REPLACE TABLE Resto AS
SELECT *,  SUBSTR(code_postal,1,2) AS Dep FROM Restaurants;

SELECT Dep, ing_id, Tot_ing, SUM(Tot_ing) AS tot FROM Resto
JOIN temp
ON Resto.pays_id = temp.pays_id
GROUP BY Dep, ing_id;



