ll database che ho creato si chiama ToysGroup ed è nato per gestire e analizzare le vendite di prodotti di una società di giocattoli. Contiene informazioni relative ai prodotti, alle vendite e alle regioni di vendita.
Tabelle principali:
1.	Sales:
	Contiene 20 righe di dati.
	Non include il prezzo e la quantità perché si assume che ogni ordine si riferisca a un singolo pezzo del prodotto dove il prezzo è specificato in quest’ultima tabella.
	Campi principali:
	IDSales (Identificatore univoco della vendita PK)
	Order_Number (Numero dell’ordine)
	Order_Date (Data dell’ordine)
	IDProduct (Collegamento alla tabella Product FK)
	IDRegion (Collegamento alla tabella Region FK)
2.	Product:
	Contiene 20 righe di dati.
	Campi principali:
	IDProduct (Identificatore univoco del prodotto PK)
	Product_Name (Nome del prodotto)
	Category (Categoria del prodotto)
	Price (Prezzo del prodotto)
3.	Region:
	Contiene 10 righe di dati.
	Campi principali:
	IDRegion (Identificatore univoco della regione PK)
	State (Nome dello stato)
	Area (Area geografica)
Relazioni tra le tabelle:
•	La tabella Sales è collegata alla tabella Product tramite la chiave ProductID.
•	La tabella Sales è collegata alla tabella Region tramite il la chiave RegionID.
