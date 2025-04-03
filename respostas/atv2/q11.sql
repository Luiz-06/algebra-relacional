/*11. Mostre o nome e o salário de cada funcionário. Extraordinariamente, cada funcionário
receberá um acréscimo neste salário de 10 reais para cada hospedagem realizada.*/

CREATE TABLE FUNCIONARIO 
(COD_FUNC SERIAL PRIMARY KEY, NOME VARCHAR(100), DT_NASC DATE, SALARIO INT);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('CLEITON', '1999-01-03', 20000);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('RONALD', '2003-11-23', 5000);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('ENZO', '2006-08-29', 1500);

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

SELECT F.NOME, F.SALARIO + (COUNT(H.COD_HOSPEDAGEM) * 10) AS SALARIO_TOTAL
FROM FUNCIONARIO AS F
LEFT JOIN HOSPEDAGEM AS H ON F.COD_FUNC = H.COD_FUNC
GROUP BY F.COD_FUNC, F.NOME, F.SALARIO;