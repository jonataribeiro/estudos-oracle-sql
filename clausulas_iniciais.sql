
AULA 2: INSTAÇÃO E CLÁUSULAS INICIAIS

SELECT 'TESTE' FROM DUAL
    
CREATE TABLE PESSOA(
    NOME        VARCHAR2(100),
    DATA_NASCIMENTO DATE,
    SEXO        VARCHAR2(1)
);
    

INSERT INTO PESSOA (NOME, DATA_NASCIMENTO, SEXO) VALUES
('MARIA ANTÔNIA', '05/10/2001', 'F');

INSERT INTO PESSOA (NOME, DATA_NASCIMENTO, SEXO) VALUES
('CARLA PRATA', '07/09/1999', 'M');

SELECT * FROM PESSOA; -- >>>>>>>>>>>> SELECECIONE TUDO DE TABELA PESSOA 


-- TIPOS DE INSTRUÇÃO SQL GEMÉRICOS

DML: COMANDOS DE MANIPULAÇÃO DE DADOS

> SELECT
> INSERT
> UPDATE
> DELETE
> MERGE

DDL: ESTRUTURA DE DADOS

> CREATE
> ALTER
> DROP
> TRUNCATE
> RENAME
> MODIFY
> COMMENT
> PURGE
> FLASHBACK

DCL: ESTRUTURA DE CONTROLE

> GRANT
> REVOKE
> WITH GRANT OPTION


==============================================================

AULA 3: ESTRUTURA SELECT, USO DE ALIAS

ESTRUTURA DO SELECET

SELECT COLUNA_1, COLUNA_2
    FROM NOME_TABELA
 WHERE CONDICAO = 1
 ORDER BY COLUNA_1
 
 
>>> TABELA DUAL - TABELA PRÉ-EXISTENTE PARA TESTES

DESCRIBE CLIENTES

SELECT * FROM CLIENTES

DESC DUAL

>>> APELIDOS DE COLUNAS (ALIAS)

SELECT NOME AS NOME_COMPLETO
    FROM PESSOA;
    

SELECT NOME AS "Nome Completo: Jônata 1306"
  FROM PESSOAS

>>> APELIDOS DE TABELAS (ALIAS)

SELECT NOME
  FROM PESSOAS C
-- (SE A TABELA NÃO SE CHAMA PESSOAS, MAS C, PRECISO CHAMAR O NOME DAS COLUNAS COM C.NOME_DA_COLUNA

SELECT C.NOME
  FROM PESSOAS C


============================================================

AULA 4: PSEUDOCOLUNA E DISTINCT

-- ROWID

SELECT ROWID, NOME
  FROM PESSOA;


DESC PESSOAS


SELECT ROWID, NOME
  FROM PESSOAS
  
  
-- ROWNUM

SELECT *
  FROM PESSOAS;
  WHERE ROWNUM < 2


-- DISTINCT

SELECT DISTINCT nome
  FROM pessoa

=============================================================

AULA 5: OPERADORES - PARTE 1

>>> CLÁUSULA WHERE

Utilizado para filtrar dados cokm os operadores disponíveis

SELECT CODIGO, NOME, NOTA_1
  FROM ALUNOS;
  
  
  
SELECT * FROM ALUNOS WHERE CODIGO = 1;

SELECT * FROM ALUNOS WHERE NOME = 'MARIA ANTÔNIA';

SELECT * FROM ALUNOS NOTA_1 = 8.5;

SELECT * FROM ALUNOS WHERE NOTA_2 = 10;


SELECT *
  FROM CLIENTES
  WHERE EMAIL = 'andre@gmail.com'

>>>>>>> OPERADOR IS NULL

Usado para verificar se um valor é nulo ou não é nulo


SELECT FROM nome_tabela WHERE coluna1 = NULL; -- Não gera erro, mas não retorna dados
SELECT FROM nome_tabela WHERE coluna1 = IS NULL;
SELECT FROM nome_tabela WHERE coluna1 = IS NOT NULL;

SELECT *
  FROM CLIENTES
 WHERE email IS NOT NULL

=============================================================

AULA 6: OPERADORES DE PADRÃO - PARTE 2

Usados para verificar padrões em valores de string

SELECT FROM nome_tabela WHERE coluna1 LIKE 'A%';
SELECT FROM nome_tabela WHERE coluna1 LIKE '%A%';
SELECT FROM nome_tabela WHERE coluna1 LIKE 'A_';
SELECT FROM nome_tabela WHERE coluna1 LIKE 'A\_%' escape '\';

select * from pessoa where nome like '%prata*_%' escape '*'

=======================================================================

AULA 7: OPERADORES LÓGICOS

SELECT *
    FROM clientes
WHERE cidade = 'São Paulo'
    AND idade > 30;

    
SELECT *
    FROM empregados
WHERE cargo = 'Gerente'
    OR cargo = 'Analista';

    

SELECT *
    FROM produtos
WHERE NOT categoria = 'Eletrônicos';



SELECT *
    FROM vendas
WHERE valor > 100
    AND (data_venda >= '2023-01-01' OR produto = 'Smartphone');
    
-- Todas as pessoas que não possuem email e também o nome possua a letra a ou: nasceram depois de 1990.
-- Durante a execução vem na sequência:
NOT
AND
OR

SELECT *
  FROM PESSOA
  WHERE email IS NULL
    AND (nome like '%a%' OR data_nascimento >= '01/01/1990')
    
================================================================================


AULA 8: CODIFICAÇÃO DE CARACTERES

CHAR E BYTE: A Relação com SQL e Tipos de Dados

CHAR: Armazena dadis fixos de caracteres

VARCHAR2: Armazena dados variáveis de caracteres

NUMBER: Armazena números inteiros ou flutuantes

DATE: Armazena data e hora

VARCHAR2(50 CHAR)
Armazena 50 letras/caracteres independente da quantidade de bytes.

VARCHAR2(50 BYTE)
Armazena 50 bytes independente da quantidade de caracteres.

===============================================================================

AULA 9: DDL - TIPOS DE DADOS

Estrutura de Criação de Tabela

CREATE TABLE nome_tabela (
    nome_da_coluna1 tipo_de_dado [restricao],
    nome_da_coluna2 tipo_de_dado [restricao],
    nome_da_coluna3 tipo_de_dado [restricao],
    ...
);


CREATE [GLOBAL TEMPORARY] TABLE nome_tabela(
    nome_coluna tipo_dado [CONSTRAINT definicao_restricao DEFAULT exp_padrao]
) [ON COMMIT {DELETE | PRESERVE} ROWS]
TABLESPACE tablespace


=========================================================================

AULA 10: DDL - CONSTRAINT - PARTE 1

TIPOS DE RESTRIÇÕES:

NULL, NOT NULL
PRIMARY KEY
FOREIGN KEY
CHECK
UNIQUE
DEFAULT

Exemplo:

1: NOT NULL
> Utilizada para indicar que a coluna deverá ser opcional ou obrigatória.
> Por padrão, uma coluna pode conter valor nulo.
> NOT NULL só pode ser definido a nível de coluna e a única constraint que não é possível criar a nível de tabela.

CREATE TABLE pessoa (
    id_pessoa       NUMBER NOT NULL,
    nome            VARCHAR2(100) NOT NULL,
    data_nascimento DATE,
    email           VARCHAR2(100) UNIQUE
);

------------

2: PRIMARY KEY
> Utilizada para identificar unicamente cada linha da tabela.
> Uma tabela não pode possuir mais de uma chave primária, mas existe o termo chave composta.
> Quando uma coluna é definida como chave primária automaticamente ela é definida como NOT NULL
> Definido a nível de coluna e tabela.

CREATE TABLE pessoa (
    id_pessoa       NUMBER PRIMARY KEY,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    email           VARCHAR2(100)
);

-------------

3: FOREIGN KEY

> Utilizada para estabelecer e garantir uma referência de integridade em relacionamentos de tabelas.
> Uma chave estrangeira pode permitir nulo ou não nulo caso especificado.
> Pode referenciar uma unique key, não somente uma primary key.

CREATE TABLE pessoas (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    id_cargo        NUMBER,
    CONSTRAINT pessoa_cargo_fk1 FOREIGN KEY (id_cargo) REFERENCES CARGO(ID_CARGO)
);

--------------

4: CHECK

> Impõe uma condição que os dados de uma coluna devem atender para serem consideradas válidos.
> Algumas expressões não são permitidas na regra de condição CHECK:
    FUNÇÕES
    PSEUDOCOLUNAS
    
CREATE TABLE pessoa (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    sexoa           VARCHAR2(1)CHECK (sexo IN('M', 'F'))
);

-------------

5: UNIQUE

> Garante que todos os valores em uma coluna ou conjunto de colunas sejam únicos.
> Se uma chave unique é composta de mais de uma coluna ela é chamada de composite unique key.
> Unique constraint permite que o campo seja nulo se não utilizarmos NOT NULL na mesma coluna.

CREATE TABLE pessoa (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    email           VARCHAR2(100) UNIQUE
);

-------------
DEFAULT

> Permite o cadastro automático de uma informação caso não seja informada.

CREATE TABLE produtos (
    id_produto  NUMBER,
    descricao   VARCHAR2(100),
    valor       NUMBER,
    STATUS      NUMBER(1) DEFAULT 1
);

================================================================================

AULA 11: DDL - CONSTRAINT - PARTE 2

-- NOT NULL

DROP TABLE PESSOAS
CREATE TABLE pessoas (
    id_pessoa       NUMBER NOT NULL,
    nome            VARCHAR2(100) NOT NULL,
    data_nascimento DATE,
    email           VARCHAR2(100)
);


-----

CREATE TABLE pessoas (
    id_pessoa       NUMBER CONSTRANT PESSOA_ID_PESSOA_NULL NOT NULL,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    email           VARCHAR2(100)
);

-------
>>>>>>>>> CONSTRAINT NOT NULL A NÍVEL DE TABELA

CREATE TABLE pessoas (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    email           VARCHAR2(100),
    CONSTRAINT ID_PESSOA_NULL NULL
);

----- PRIMARY KEY

CREATE TABLE pessoas (
    id_pessoa       NUMBER PRIMARY KEY,
    nome            VARCHAR2(100),
    data_nascimento DATE,
    email           VARCHAR2(100)
);

-- MAIS RECOMENDADO A NÍVEL DE TABELA

CREATE TABLE pessoas (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE NOT NULL,
    email           VARCHAR2(100)
);

ALTER TABLE pessoas ADD CONSTRAINT ID_PESSOA_PK1 PRIMARY KEY(id_pessoa)


-- FOREIGN KEY

CREATE TABLE CARGO(
  ID_CARGO  NUMBER,
  DESCRICAO VARCHAR2(100)
);


CREATE TABLE pessoas (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE NOT NULL,
    email           VARCHAR(100),
    id_cargo        NUMBER,
);

Obs.: O ideal é criar a tabela limpa e depois fazer as alterações por fora.

ALTER TABLE PESSOAS ADD CONSTRAINT pessoa_cargo_fk1 FOREIGN KEY (id_cargo0 REFERENCES CARGO(ID_CARGO)

================================================================================

AULA 12: DDL - CONSTRAINT - PARTE 3

-- DEFAULT (PADRÃO)

CREATE TABLE pessoas (
    id_pessoa       NUMBER PRIMARY KEY,
    nome            VARCHAR2(100),
    data_cadastro   DATE DEFAULT SYSDATE,
    status          NUMBER DEFAULT 0 -- ZERO SIGNIFICA DESATIVADO
);

-->>> ATENÇÃO AO CRIAR UM DEFAULT:
-- QUANDO EU VOU UTILIZAR O DEFAULT COM O NOT NULL, A ATENTAR-SE NA ORDEM DE IMPRESSÃO.

INSERT INTO PESSOAS (ID_PESSOA, NOME) VALUES (1, 'MARIA');

-- CHECK
CREATE TABLE empregados (
    id_empregado    NUMBER PRIMARY KEY,
    salario         NUMBER,
    CONSTRAINT chk_salario CHECK (salario > 0 AND salario <= 1000)
);


INSERT INTO EMPREGADOS VALUES(1, 10);

-----

CREATE TABLE empregados (
    id_venda        NUMBER PRIMARY KEY,
    valor           NUMBER,
    data_venda      DATE,
    CONSTRAINT data CHECK (data_venda >= TO_DATE('01/01/2026', 'DD/MM/YYYY'))
);




-- Classificação de dados:
Estrutura ORDER BY
Utillizado para classificar dados

SELECT id_pessoa, nome
    FROM pessoa
ORDER BY nomne

SELECT id_pessoa, nome
    FROM pessoa
ORDER BY nomne ASC

SELECT id_pessoa, nome
    FROM pessoa
ORDER BY nomne DESC

-----------------------------------

CREATE TABLE pessoas (
    id_pessoa       NUMBER,
    nome            VARCHAR2(100),
    data_nascimento DATE DEFAULT SYSDATE,
    status          NUMBER DEFAULT 0,
    email           VARCHAR2(100)
);

ALTER TABLE pessoas
RENAME COLUMN data_nascimento TO
data_cadastro;

INSERT INTO PESSOAS (ID_PESSOA, NOME, STATUS) VALUES (1, 'MARIA', 1);
INSERT INTO PESSOAS (ID_PESSOA, NOME) VALUES (2, 'MARTA');
INSERT INTO PESSOAS (ID_PESSOA, NOME, EMAIL) VALUES (3, 'ANA', 'ana@gmail.com');
INSERT INTO PESSOAS (ID_-ESSOA, NOME, EMAIL) VALUES (4, 'ANTÔNIO', 'antonio@gmail.com');
INSERT INTO PESSOAS (ID_PESSOA, NOME) VALUES (5, 'FELIPE');
INSERT INTO PESSOAS (ID_PESSOA, NOME) VALUES (6, 'RAFAELA');


UPDATE PESSOAS SET DATA_CADASTRO = SYSDATE - 10 WHERE ID_PESSOA = 2

SELECT id_pessoa
    FROM PESSOAS
    ORDER BY data_cadastro

Estrutura ORDER BY
Utillizado para classificar dados

SELECT id_pessoa, nome
    FROM pessoa
 ORDER BY 1

SELECT id_pessoa, nome
    FROM pessoa
 ORDER BY 3 -- gera erro
-----------------------------
SELECT id_pessoa, nome
    FROM pessoa
 ORDER BY 1, nome DESC
 
 SELECT id_pessoa, nome
    FROM pessoa
 ORDER BY id_departamento (utilizar o nome da coluna identifica dentro de uma empresa para evitar erros em grupo)
-----------------------------

SELECT id_pessoa, nome AS nome_completo
    FROM pessoa
 ORDER BY nome_completo
----------------------------------------

SELECT id_pessoa, nome AS nome_completo
    FROM pessoa
 ORDER BY UPPER(nome_completo) || id_pessoa

SELECT id_pessoa, nome AS nome_completo
    FROM pessoa
 ORDER BY 2 * 7
 
SELECT id_pessoa, nome AS nome_completo
    FROM pessoa
 ORDER BY DISTINCT nome -- gera erro
========================================


VALORES NULOS DENTRO DA ESTRUTURA ORDER BY

SELECT nome, data_nascimento
    FROM pessoa
    ORDER BY 2 NULLS LAST  >>>>>> ORDENA A COLUNA DATA_NASCIMENTO, MAS JOGA OS NULOS LÁ PRO FINAL
    
SELECT nome, data_nascimento
    FROM pessoa
    ORDER BY 2 NULLS FIRST >>>>>> ORDENA A COLUNA DATA_NASCIMENTO, MAS JOGA OS NULOS LÁ PRO COMEÇO
----------------------------------------

SELECT id_pessoa
    FROM PESSOAS
order by 2

SELECT *
    FROM PESSOAS
    ORDER BY EMAIL DESC NULLS LAST
===================================

-- ORDER BY COM ROWNUM

 SELECT *
 FROM PESSOAS
order by nome ASC

ANA
ANTÔNIO
FELIPE
MARIA

SELECT *
 FROM PESSOAS
 WHERE ROWNUM <= 4
ORDER BY nome ASC >>>>>> -- AQUI ESTOU DIZENDO QUE QUERO OS 4 PRIMEIROS
-- TEM QUE TER CUIDADO AO USAR O ORDER BY NESSA REGRA ROWNUM COM ORDER BY
===========================================================================

