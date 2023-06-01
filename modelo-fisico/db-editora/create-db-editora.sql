-- Script para criação do banco de dados db_editora
--
DROP DATABASE IF EXISTS db_editora
;
CREATE DATABASE db_editora
;
USE db_editora
;
CREATE TABLE cep
(
    numero_cep      CHAR(8)         NOT NULL,
    nome_rua        VARCHAR(255)    NOT NULL,
    nome_cidade     VARCHAR(255)    NOT NULL,
    nome_bairro     VARCHAR(255)    NOT NULL,

    CONSTRAINT pk_cep
        PRIMARY KEY(numero_cep)
) engine="innodb"
;

CREATE TABLE cliente
(

    codigo_cliente      MEDIUMINT UNSIGNED  NOT NULL,
    nome_cliente        VARCHAR(255)        NOT NULL,
    numero_residencia   VARCHAR(10)         NOT NULL,
    numero_complemento  VARCHAR(10)         NOT NULL,
    numero_cep          CHAR(8)             NOT NULL, 

    CONSTRAINT pk_cliente
        PRIMARY KEY(codigo_cliente), 

    CONSTRAINT fk_cliente_cep
        FOREIGN KEY(numero_cep) REFERENCES cep(numero_cep) 

) engine="innodb"
;
CREATE TABLE telefone_cliente
(

    id_telefone_cliente     MEDIUMINT UNSIGNED  NOT NULL AUTO_INCREMENT,    
    codigo_cliente          MEDIUMINT UNSIGNED  NOT NULL,
    numero_telefone         CHAR(11)            NOT NULL,
    
    
    CONSTRAINT pk_telefone_cliente
        PRIMARY KEY(id_telefone_cliente), 

    CONSTRAINT fk_cliente_telefone_cliente
        FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente) 

) engine="innodb"
;
CREATE TABLE tema   
(
    codigo_tema             SMALLINT   UNSIGNED    NOT NULL AUTO_INCREMENT,
    nome_tema                 VARCHAR(255)           NOT NULL,
  
    CONSTRAINT pk_tema
        PRIMARY KEY(codigo_tema)

) engine="innodb"
;
CREATE TABLE revista
(

    numero_isbn             CHAR(10)            NOT NULL,
    codigo_tema             SMALLINT  UNSIGNED  NOT NULL,
    nome_titulo             VARCHAR(255)        NOT NULL,
    numero_periodicidade    SMALLINT  UNSIGNED  NOT NULL,

    CONSTRAINT pk_revista
        PRIMARY KEY(numero_isbn), 

    CONSTRAINT fk_revista_tema
        FOREIGN KEY(codigo_tema) REFERENCES tema(codigo_tema) 

) engine="innodb"
;

CREATE TABLE assinatura
(
    id_assinatura       MEDIUMINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    numero_isbn         CHAR(10)            NOT NULL,
    codigo_cliente      MEDIUMINT UNSIGNED  NOT NULL,
    data_inicio         DATE                NOT NULL,
    data_termino        DATE                NOT NULL, 

    CONSTRAINT pk_assinatura
        PRIMARY KEY(id_assinatura), 

    CONSTRAINT fk_assinatura_cliente
        FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente) 

) engine="innodb"
;
CREATE TABLE pagamento
(
    id_assinatura       MEDIUMINT UNSIGNED  NOT NULL,
    numero_pagamento    MEDIUMINT UNSIGNED  NOT NULL,
    data_vencimento     DATE                NOT NULL,
    valor_pagamento     DECIMAL(8,2)        NOT NULL,

    CONSTRAINT pk_pagamento
        PRIMARY KEY(id_assinatura, numero_pagamento), 

    CONSTRAINT fk_pagamento_assinatura
        FOREIGN KEY(id_assinatura) REFERENCES assinatura(id_assinatura) 

) engine="innodb"
;
CREATE TABLE artigo
(

    numero_doi              CHAR(13)            NOT NULL,
    numero_isbn             CHAR(10)            NOT NULL,
    nome_titulo             VARCHAR(255)        NOT NULL,
    descricao_resumo        TEXT                NOT NULL,
    descricao_texto         TEXT                NOT NULL,
    numero_pagina           SMALLINT UNSIGNED   NOT NULL,

    CONSTRAINT pk_artigo
        PRIMARY KEY(numero_doi), 

    CONSTRAINT fk_artigo_revista
        FOREIGN KEY(numero_isbn) REFERENCES revista(numero_isbn) 

) engine="innodb"
;
CREATE TABLE artigo_referencia
(

    numero_doi_artigo       CHAR(13)    NOT NULL,
    numero_doi_referencia   CHAR(13)    NOT NULL,

    CONSTRAINT pk_artigo_referencia
        PRIMARY KEY(numero_doi_artigo, numero_doi_referencia), 

    CONSTRAINT fk_artigo_referencia_artigo
        FOREIGN KEY(numero_doi_artigo) REFERENCES artigo(numero_doi),
    
    CONSTRAINT fk_artigo_referencia_artigo_referencia
        FOREIGN KEY(numero_doi_referencia) REFERENCES artigo(numero_doi)
         

) engine="innodb"
;
CREATE TABLE autor
(

    numero_cpf          CHAR(11)            NOT NULL,
    nome_cliente        VARCHAR(255)        NOT NULL,
    endereco_email      VARCHAR(255)        NOT NULL,
    endereco_lattes     VARCHAR(255)        NOT NULL,

    CONSTRAINT pk_autor
        PRIMARY KEY(numero_cpf)

) engine="innodb"
;
CREATE TABLE telefone_autor
(

    id_telefone_autor       MEDIUMINT UNSIGNED  NOT NULL AUTO_INCREMENT,    
    numero_cpf              CHAR(11)            NOT NULL,
    numero_telefone         CHAR(11)            NOT NULL,
    
    
    CONSTRAINT pk_telefone_autor
        PRIMARY KEY(id_telefone_autor), 

    CONSTRAINT fk_telefone_autor_autor
        FOREIGN KEY(numero_cpf) REFERENCES autor(numero_cpf) 

) engine="innodb"
;
CREATE TABLE artigo_autor
(
    numero_cpf  CHAR(11)    NOT NULL,
    numero_doi  CHAR(13)    NOT NULL, 

    CONSTRAINT pk_artigo_autor
        PRIMARY KEY(numero_cpf, numero_doi),
    
    CONSTRAINT fk_artigo_autor_autor
        FOREIGN KEY(numero_cpf) REFERENCES autor(numero_cpf),

    CONSTRAINT fk_artigo_autor_artigo
        FOREIGN KEY(numero_doi) REFERENCES artigo(numero_doi)
) engine="innodb"
;