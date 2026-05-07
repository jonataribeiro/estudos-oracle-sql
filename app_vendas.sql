-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   em:        2026-04-08 04:13:14 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tab_clientes (
    id_cliente    NUMBER NOT NULL,
    nome          VARCHAR2(100 CHAR),
    email         VARCHAR2(100),
    data_cadastro DATE
);

ALTER TABLE tab_clientes ADD CONSTRAINT tab_clientes_pk PRIMARY KEY ( id_cliente );

CREATE TABLE tab_produtos (
    id_produto   NUMBER NOT NULL,
    nome_produto VARCHAR2(100 CHAR),
    preco        NUMBER,
    estoque      NUMBER
);

ALTER TABLE tab_produtos ADD CONSTRAINT tab_produtos_pk PRIMARY KEY ( id_produto );

CREATE TABLE tb_vendas (
    id_vendas               NUMBER NOT NULL,
    quantidade              NUMBER,
    data_venda              DATE,
    tab_clientes_id_cliente NUMBER NOT NULL,
    tab_produtos_id_produto NUMBER NOT NULL
);

ALTER TABLE tb_vendas ADD CONSTRAINT tb_vendas_pk PRIMARY KEY ( id_vendas );

ALTER TABLE tb_vendas
    ADD CONSTRAINT tb_vendas_tab_clientes_fk FOREIGN KEY ( tab_clientes_id_cliente )
        REFERENCES tab_clientes ( id_cliente );

ALTER TABLE tb_vendas
    ADD CONSTRAINT tb_vendas_tab_produtos_fk FOREIGN KEY ( tab_produtos_id_produto )
        REFERENCES tab_produtos ( id_produto );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
