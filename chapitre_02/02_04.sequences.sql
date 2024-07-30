CREATE TEMPORARY TABLE ilot (
    numero int NOT NULL
);

INSERT INTO ilot (numero)
VALUES (1), (2), (3), (11), (12), (13), (25), (26), (27);

SELECT *
FROM ilot;

WITH t AS (
    SELECT 
        numero,
        numero - ROW_NUMBER() OVER (ORDER BY numero) AS groupe
    FROM ilot
)
SELECT 
    MIN(numero),
    MAX(numero),
    COUNT(*)
FROM t
GROUP BY groupe;



CREATE TEMPORARY TABLE ilot_doublons (
    numero int NOT NULL
);

INSERT INTO ilot_doublons (numero)
VALUES (1), (2), (3), (11), (11), (12), (13), (25), (25), (26), (27);

SELECT *
FROM ilot_doublons;

    SELECT 
        numero,
        DENSE_RANK()  OVER (ORDER BY numero),
        numero - DENSE_RANK()  OVER (ORDER BY numero) AS groupe
    FROM ilot_doublons;


WITH t AS (
    SELECT 
        numero,
        numero - DENSE_RANK() OVER (ORDER BY numero) AS groupe
    FROM ilot_doublons
)
SELECT 
    MIN(numero),
    MAX(numero),
    COUNT(*)
FROM t
GROUP BY groupe;
