# Awk
Escaneador de patrones y procesador de lenguaje. Permite filtrar por condiciones, obtener columnas de texto de un fichero. Mucho más preciso que `grep`  
Por defecto, separa las columnas **por espacios.**

Tenemos un fichero, que queremos analizar, el cual contiene records del estilo:

```
2018-05-24 14485 101336222032 SALE PRODUCT_COMPOSITION PRODUCT_COMPOSITION_MNL Meisterschaft NL INT_PRODFAM/SPORTING 2018-12-22 19:45:00.0 50000 2500 20849896 EVZ_BEH 216954263 S Kat.3 Meisterschaft NL EV Zug SC Rapperswil-Jona Lakers Erwachsene - 1997 und älter   
2018-05-24 14485 101336222033 SALE PRODUCT_COMPOSITION PRODUCT_COMPOSITION_MNL Meisterschaft NL INT_PRODFAM/SPORTING 2019-02-15 19:45:00.0 50000 2500 20849896 EVZ_BEH 216954263 S Kat.3 Meisterschaft NL EV Zug SCL Tigers Erwachsene - 1997 und älter
2018-05-24 14485 101336222034 SALE PRODUCT_COMPOSITION PRODUCT_COMPOSITION_MNL Meisterschaft NL INT_PRODFAM/SPORTING 2019-01-22 19:45:00.0 50000 2500 20849896 EVZ_BEH 216954263 S Kat.3 Meisterschaft NL EV Zug Genève-Servette HC Erwachsene - 1997 und älter
2018-05-24 14485 101336222035 SALE PRODUCT_COMPOSITION PRODUCT_COMPOSITION_MNL Meisterschaft NL INT_PRODFAM/SPORTING 2018-10-05 19:45:00.0 50000 2500 20849896 EVZ_BEH 216954263 S Kat.3 Meisterschaft NL EV Zug Genève-Servette HC Erwachsene - 1997 und älter
```

### Stackear filtros
`awk $19 == "S"' AccountingExport_20190115.tt | awk -F '\t' '{print $4}'`

El output de uno se puede usar como el input de otro.

### Cambiar char de filtrado
`cat fichero.txt | awk -F '\t' '{print $19}'`  

En este caso `'\t'` es usar **tabs** en vez de spaces.

### Operar con Columnas
#### Obtener todas las columnas #19
`cat fichero.txt | awk '{print $19}'`

```
P

Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3
Kat.3

Meisterschaft
```

#### Obtener sólo 1 línea por resultado único
`cat fichero.txt | awk '{print $19}' | sort | uniq`

`sort` es un pre-requisito para poder ejecutar `uniq`.

```
P
Kat.3
Meisterschaft
```

#### Mostrar número de líneas
`cat fichero.txt | awk '{print NR, $19}'`

```
19870 P
19871 P
19872
19873
19874 Meisterschaft
19875 Meisterschaft
19876 Meisterschaft
19877 Meisterschaft
```

### Filtros
#### Obtener resultados, que cumplan la condición de una columna
`awk '$19 == "S"' fichero.txt`  

Sin `'{print}'` se obtienen filas enteras de vuelta, en vez de columnas.


```
2018-06-05	14732	101338609203	SALE	SIMPLE_PRODUCT	SIMPLE_PRODUCT_MG_OS					Vereinsmitglied o.S.	INT_PRODFAM/MEM		100000	0	20849895	EVZ_BEH	216953870	S					Erwachsene
2018-06-05	14733	101338609204	SALE	COMPOSED_PRODUCT	COMPOSED_PRODUCT_MNL_ABO					NL Abo Saison 18/19	INT_PRODFAM/STPREDEFINED		1650000	2500	20849896	EVZ_BEH	216938361	S		Erwachsene
```

#### OR
`awk '$4 == "REFUND_CLIENT" || $4 == "SALE"'`
Obtener filas, donde la columna #4 es igual a "REFUND_CLIENT" **o** "SALE".
