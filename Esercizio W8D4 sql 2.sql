USE ToysGroup;
 SELECT * FROM Product;
 SELECT * FROM Region;
 SELECT * FROM Sales;
 -- 1)Verificare che i campi definiti come PK siano univoci. 
-- In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).

-- sto contando, grazie a having e count, se ci sono piu' chiavi primarie ripetute
 SELECT IDProduct, COUNT(*) as Count
 FROM Product
 GROUP BY IDProduct
 HAVING Count > 1;
 
 SELECT IDRegion, COUNT(*) as Count
 FROM Region
 GROUP BY IDRegion
 HAVING Count > 1;
 
 SELECT IDSales, COUNT(*) as Count
 FROM Sales
 GROUP BY IDSales
 HAVING Count > 1;
 
 -- 2)Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto,
 -- la categoria del prodotto, il nome dello stato, il nome della regione di vendita e un campo booleano 
 -- valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)
 
 -- ho selezionato ciò che richiede l'eserczio ma ho dovuto fare un controllo per le date dell'ordine specificando 
 -- 0 se sono passati meno di 180 giorni dalla vendita e 1 se sono passati piu' di 180 giorni.
 -- alla fine ho creato una join che unisse tutte le 3 tabelle 
 SELECT s.Order_Number, s.Order_Date, p.Product_Name as Product, p.Category as Category, r.State, r.Area,
 (DATEDIFF(CURRENT_DATE, s.Order_Date) > 180) AS MoreThan180Days
 FROM Product as p JOIN Sales as s ON p.IDProduct = s.IDProduct
 JOIN Region as r ON r.IDRegion = s.IDRegion;
 
 -- 3)Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito.
 -- (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano).
 -- Nel result set devono comparire solo il codice prodotto e il totale venduto.
 
-- ho creato una subquery poichè volevo estrapolare il totale dei prezzi per porodotto maggiore della media veduta nell'ultimo anno 
-- inoltre ho dovuto fare un controllo nella where chiendendo di filtrare per IDProduct della tabella Sales
-- ovvero di prendere solo i prodotti venduti 	
 SELECT p.IDProduct, SUM(p.Price) as Tot
 FROM Product as p LEFT JOIN Sales as s ON p.IDProduct = s.IDProduct
 WHERE s.IDProduct IS NOT NULL
 GROUP BY IDProduct
 HAVING Tot > (SELECT AVG(p.Price)
				FROM Product as p JOIN Sales as s ON p.IDProduct = s.IDProduct
				WHERE s.Order_Date BETWEEN CURRENT_DATE()-365 AND CURRENT_DATE()
			   );
               
               
-- 4)Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.                

-- ho selezionato il nome del prodotto, l'anno di vendita e la somma del prezzo e dopo ho raggruppato tutto per anno e prodotto
-- il where che ho inserito mi fa capire se il prodotto è sato realmente venduto 
SELECT p.Product_Name as Product, YEAR(s.Order_Date) as Order_Date, SUM(p.Price) as Tot
FROM Product as p  LEFT JOIN Sales as s ON p.IDProduct = s.IDProduct
WHERE s.IDProduct IS NOT NULL
GROUP BY YEAR(Order_Date), Product;

-- 5)Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente

-- sto esponendo il fatturato totale per stato e per anno raggruppando quest'utlimi, inoltre con order by sto chidendo di ordinarmi in
-- ordine decrescente ma non posso farlo per entrambe le colonne quindi ho fatto solo per anno 
SELECT r.State as State, YEAR(s.Order_Date) as Orders_Year, SUM(p.Price) as Tot
FROM Region as r JOIN Sales as s ON r.IDRegion = s.IDRegion 
JOIN Product as p ON s.IDProduct = p.IDProduct
GROUP BY State, Orders_Year
ORDER BY Orders_Year DESC;

-- 6)Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

-- ho selezionato la categoria e un count di tutto e facendo un controllo 
-- sul count ho capito quali sono i prodotti piu' venduti quindi richiesti 
SELECT Category,  COUNT(*) AS Count
FROM Product
GROUP BY Category
HAVING Count>3;


-- 7)Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.

-- controllo quali sono i prodotti invednuti attraverso una where sulla tabella sales e la colonna idproduct

-- in questa select ho controllato quali id prodotti della tabella product non facessero parte 
-- degli id prodotti nella tabella sales capendo la vendita o meno 
SELECT p.IDProduct, p.Product_Name, p.Category, p.Price
FROM Product as p
WHERE p.IDProduct NOT IN (
    SELECT s.IDProduct
    FROM Sales as s
);

-- in questa select ho inserito una left join da parte di porodotti
-- in modo da visualizzare anche i non venduti con NULL
-- dopo ho filtaro solo i prodotti NULL quindi non venduti 
SELECT p.IDProduct, p.Product_Name as Product, p.Category, p.Price
FROM Product p LEFT JOIN Sales s ON p.IDProduct = s.IDProduct
WHERE s.IDSales IS NULL;


-- 8)Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” 
-- delle informazioni utili (codice prodotto, nome prodotto, nome categoria)

-- ho creato questa vista, chiamata Useful_Information, per visualizzare codice prodotto, nome prodotto, nome categoria
CREATE VIEW Useful_Information AS
SELECT p.IDProduct, p.Product_Name as Product, p.Category 
FROM Product as p;

SELECT * FROM Useful_Information;

-- 9)Creare una vista per le informazioni geografiche

-- ho creato questa view per visualizzare lo stato con la propria area geografica
-- visualizzando tutto ciò che , secondo me, fa parte delle informazioni geografiche in base a questo DB 
CREATE VIEW Geographical_Information AS
SELECT r.State, r.Area
FROM Region as r;

SELECT * FROM Geographical_Information;

-- extra esercizi, ho voluto creare questa vista per visualizzare gli ordini con i ri rispettivi prodotti e prezzi  

CREATE VIEW Complete_Order AS
SELECT s.IDSales, s.Order_Number, s.Order_Date, p.Product_Name, p.Price
FROM Sales as s JOIN Product as p ON s.IDProduct = p.IDProduct;

SELECT * FROM Complete_Order;
