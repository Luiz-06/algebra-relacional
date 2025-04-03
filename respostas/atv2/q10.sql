/*10. Crie a tabela funcionário com as atributos: cod_func, nome, dt_nascimento e salário.
Depois disso, acrescente o cod_func como chave estrangeira nas tabelas hospedagem e
reserva.*/

CREATE TABLE FUNCIONARIO 
(COD_FUNC SERIAL PRIMARY KEY, NOME VARCHAR(100), DT_NASC DATE, SALARIO INT);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('CLEITON', '1999-01-03', 20000);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('RONALD', '2003-11-23', 5000);
INSERT INTO FUNCIONARIO(NOME, DT_NASC, SALARIO) 
VALUES('ENZO', '2006-08-29', 1500);

ALTER TABLE HOSPEDAGEM
ADD COLUMN COD_FUNC INT;

ALTER TABLE HOSPEDAGEM
ADD CONSTRAINT fk_funcionario_hosp FOREIGN KEY (COD_FUNC) REFERENCES FUNCIONARIO(COD_FUNC);

ALTER TABLE RESERVA
ADD COLUMN COD_FUNC INT;

ALTER TABLE RESERVA
ADD CONSTRAINT fk_funcionario_reserva FOREIGN KEY(COD_FUNC) REFERENCES FUNCIONARIO(COD_FUNC);

