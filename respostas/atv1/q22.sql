/*22. O nome da categoria mais cara que foi ocupado pelo hóspede mais velho.*/

CREATE TABLE CATEGORIA 
(COD_CAT SERIAL PRIMARY KEY, NOME VARCHAR(100), PRECO INT, DESCRICAO TEXT);
INSERT INTO CATEGORIA (NOME, PRECO, DESCRICAO) 
VALUES ('LUXO', 300, 'PARA RICOS');
INSERT INTO CATEGORIA (NOME, PRECO, DESCRICAO) 
VALUES ('DUBLE', 200, 'PARA DUBLES');
INSERT INTO CATEGORIA (NOME, PRECO, DESCRICAO) 
VALUES ('MEDIO', 150, 'CLASSE MEDIA');
INSERT INTO CATEGORIA (NOME, PRECO, DESCRICAO) 
VALUES ('POBRE', 100, 'PARA POBRES');

CREATE TABLE APARTAMENTO 
(NUM_AP SERIAL PRIMARY KEY, COD_CAT INT,
FOREIGN KEY (COD_CAT) REFERENCES CATEGORIA(COD_CAT));
INSERT INTO APARTAMENTO (COD_CAT)
VALUES (1);
INSERT INTO APARTAMENTO (COD_CAT)
VALUES (2);
INSERT INTO APARTAMENTO (COD_CAT)
VALUES (3);
INSERT INTO APARTAMENTO (COD_CAT)
VALUES (4);

CREATE TABLE HOSPEDAGEM 
(COD_HOSPEDAGEM SERIAL PRIMARY KEY, NUM_AP INT, COD_HOSP INT, COD_FUNC INT, DT_ENT DATE, DT_SAIDA DATE,
FOREIGN KEY (NUM_AP) REFERENCES APARTAMENTO(NUM_AP),
FOREIGN KEY (COD_HOSP) REFERENCES HOSPEDE(COD_HOSP),
FOREIGN KEY (COD_FUNC) REFERENCES FUNCIONARIO(COD_FUNC));
INSERT INTO HOSPEDAGEM (NUM_AP, COD_HOSP, COD_FUNC, DT_ENT, DT_SAIDA)
VALUES (1, 1, 1, '2025-1-1', '2025-1-2');
INSERT INTO HOSPEDAGEM (NUM_AP, COD_HOSP, COD_FUNC, DT_ENT, DT_SAIDA)
VALUES (2, 2, 2, '2025-1-1', '2025-1-3');
INSERT INTO HOSPEDAGEM (NUM_AP, COD_HOSP, COD_FUNC, DT_ENT, DT_SAIDA)
VALUES (3, 3, 3, '2025-1-1', '2025-1-4');
INSERT INTO HOSPEDAGEM (NUM_AP, COD_HOSP, COD_FUNC, DT_ENT, DT_SAIDA)
VALUES (4, 4, 4, '2025-1-1', NULL);

CREATE TABLE HOSPEDE 
(COD_HOSP SERIAL PRIMARY KEY, NOME VARCHAR(100), DT_NASC DATE);
INSERT INTO HOSPEDE (NOME, DT_NASC)
VALUES ('CHICO', '2005-1-6');
INSERT INTO HOSPEDE (NOME, DT_NASC)
VALUES ('JOAO', '1967-3-20');
INSERT INTO HOSPEDE (NOME, DT_NASC)
VALUES ('DONA ANGELA', '1972-12-8');
INSERT INTO HOSPEDE (NOME, DT_NASC)
VALUES ('CHICA', '2005-7-10');

CREATE TABLE FUNCIONARIO (COD_FUNC SERIAL PRIMARY KEY, NOME VARCHAR(100), DT_NASC DATE);
INSERT INTO FUNCIONARIO (NOME, DT_NASC)
VALUES ('RABICO', '1960-10-5');
INSERT INTO FUNCIONARIO (NOME, DT_NASC)
VALUES ('ADOLFO', '2000-3-20');
INSERT INTO FUNCIONARIO (NOME, DT_NASC)
VALUES ('RITA', '2000-5-29');
INSERT INTO FUNCIONARIO (NOME, DT_NASC)
VALUES ('CLEITON', '1980-3-20');

ALTER TABLE HOSPEDE 
ADD COLUMN NAC VARCHAR (100);
UPDATE HOSPEDE
SET NAC = 'ANGOLANO'
WHERE NOME = 'CHICO';
UPDATE HOSPEDE 
SET NAC = 'BRASILEIRO'
WHERE NOME = 'JOAO';
UPDATE HOSPEDE 
SET NAC = 'URUGUAIA'
WHERE NOME = 'DONA ANGELA';
UPDATE HOSPEDE
SET NAC = 'MEXICANA'
WHERE NOME = 'CHICA';

UPDATE CATEGORIA 
SET PRECO = PRECO * 1.10;

SELECT NOME, PRECO FROM CATEGORIA 
WHERE PRECO = (SELECT MAX(PRECO) FROM CATEGORIA C 
    JOIN APARTAMENTO AP ON C.COD_CAT = AP.COD_CAT
    JOIN HOSPEDAGEM HS ON AP.NUM_AP = HS.NUM_AP
    JOIN HOSPEDE H ON HS.COD_HOSP = H.COD_HOSP
    WHERE H.DT_NASC = (SELECT MIN(H2.DT_NASC) FROM HOSPEDE H2));