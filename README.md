🎯 Scopo del progetto
Il database ToysGroup è stato progettato per gestire e analizzare le vendite di prodotti di una società attiva nel settore dei giocattoli. Il modello relazionale consente di monitorare informazioni su prodotti, vendite e aree geografiche.

📦 Tabella Product
Contiene 20 righe di dati relativi agli articoli.
Campi principali:
- IDProduct (PK)
- Product_Name 
- Category 
- Price
  
🧾 Tabella Sales
Raccoglie 20 ordini, ognuno riferito a un singolo pezzo.
Campi principali:
- IDSales (PK)
- Order_Number #️
- Order_Date 
- IDProduct (FK)
- IDRegion (FK)
  
🌍 Tabella Region
Descrive 10 stati raggruppati per area geografica.
Campi principali:
- IDRegion (PK)
- State 
- Area
  
🔗 Relazioni
- Sales è collegata a Product tramite IDProduct
- Sales è collegata a Region tramite IDRegion


![image](https://github.com/user-attachments/assets/16e1d97b-bdf6-4d5d-a9d0-b00384922b12)

