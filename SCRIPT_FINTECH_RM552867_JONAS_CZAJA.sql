
CREATE TABLE T_FNT_CONTA (
    cd_conta      NUMBER(4) NOT NULL,
    nm_banco      VARCHAR2(30 CHAR) NOT NULL,
    vl_saldo      NUMBER NOT NULL,
    ds_tipo       VARCHAR2(20 CHAR) NOT NULL,
    vl_rendimento NUMBER NOT NULL,
    cd_usuario    NUMBER(3) NOT NULL
);

ALTER TABLE T_FNT_CONTA ADD CONSTRAINT T_FNT_CONTA_PK PRIMARY KEY ( cd_conta,
                                                                    cd_usuario );

CREATE TABLE T_FNT_GASTO (
    cd_gasto          NUMBER(4) NOT NULL,
    ds_tipo_gasto     VARCHAR2(20),
    ds_gasto          VARCHAR2(60 CHAR) NOT NULL,
    ds_categoria      VARCHAR2(20 CHAR) NOT NULL,
    vl_gasto          NUMBER NOT NULL,
    dt_gasto          DATE NOT NULL,
    ds_cartao_credito VARCHAR2(20 CHAR),
    nr_parcelas       NUMBER(2),
    cd_usuario        NUMBER(3) NOT NULL
);

ALTER TABLE T_FNT_GASTO ADD CONSTRAINT T_FNT_GASTO_PK PRIMARY KEY ( cd_gasto,
                                                                   cd_usuario );



CREATE TABLE T_FNT_DIVIDA (
    cd_divida       NUMBER(4) NOT NULL,
    vl_valor        NUMBER NOT NULL,
    ds_divida       VARCHAR2(60 CHAR),
    dt_prazo        DATE NOT NULL,
    cd_usuario      NUMBER(3) NOT NULL
);                                                                   
   
ALTER TABLE T_FNT_DIVIDA ADD CONSTRAINT T_FNT_DIVIDA_PK PRIMARY KEY ( cd_divida,
                                                                    cd_usuario );
                                                                   
CREATE TABLE T_FNT_INVESTIMENTO (
    cd_negociacao      NUMBER(4) NOT NULL,
    ds_negociacao      VARCHAR2(6 CHAR) NOT NULL,
    dt_negociacao      DATE NOT NULL,
    ds_categoria       VARCHAR2(15 CHAR) NOT NULL,
    nm_ativo           VARCHAR2(30 CHAR) NOT NULL,
    vl_preco_medio     NUMBER NOT NULL,
    nr_quantidade      NUMBER(5) NOT NULL,
    vl_valor_investido NUMBER NOT NULL,
    dt_vencimento      DATE,
    cd_usuario         NUMBER(3) NOT NULL
);

ALTER TABLE T_FNT_INVESTIMENTO ADD CONSTRAINT T_FNT_INVESTIMENTO_PK PRIMARY KEY ( cd_usuario,
                                                                                  cd_negociacao );


CREATE TABLE T_FNT_RECEITA (
    cd_receita     NUMBER(4) NOT NULL,
    ds_receita     VARCHAR2(60 CHAR) NOT NULL,
    ds_categoria   VARCHAR2(20 CHAR) NOT NULL,
    vl_receita     NUMBER NOT NULL,
    dt_recebimento DATE NOT NULL,
    cd_usuario     NUMBER(3) NOT NULL
);

ALTER TABLE T_FNT_RECEITA ADD CONSTRAINT T_FNT_RECEITA_PK PRIMARY KEY ( cd_receita,
                                                                        cd_usuario );

CREATE TABLE T_FNT_USUARIO (
    cd_usuario  NUMBER(3) NOT NULL,
    nm_nome     VARCHAR2(60 CHAR) NOT NULL,
    ds_email    VARCHAR2(60 CHAR) NOT NULL,
    nr_telefone NUMBER(11) NOT NULL,
    ds_senha    VARCHAR2(16 CHAR) NOT NULL
);

ALTER TABLE T_FNT_USUARIO ADD CONSTRAINT T_FNT_USUARIO_PK PRIMARY KEY ( cd_usuario );

ALTER TABLE T_FNT_CONTA
    ADD CONSTRAINT T_FNT_CONTA_USUARIO_FK FOREIGN KEY ( cd_usuario )
        REFERENCES T_FNT_USUARIO ( cd_usuario );

ALTER TABLE T_FNT_GASTO
    ADD CONSTRAINT T_FNT_GASTO_USUARIO_FK FOREIGN KEY ( cd_usuario )
        REFERENCES T_FNT_USUARIO ( cd_usuario )
            ON DELETE CASCADE;
            
ALTER TABLE T_FNT_DIVIDA
    ADD CONSTRAINT T_FNT_DIVIDA_USUARIO_FK FOREIGN KEY ( cd_usuario )
        REFERENCES T_FNT_USUARIO ( cd_usuario )
            ON DELETE CASCADE;

ALTER TABLE T_FNT_INVESTIMENTO
    ADD CONSTRAINT T_FNT_INVESTIMENTO_USUARIO_FK FOREIGN KEY ( cd_usuario )
        REFERENCES T_FNT_USUARIO ( cd_usuario )
            ON DELETE CASCADE;

ALTER TABLE T_FNT_RECEITA
    ADD CONSTRAINT T_FNT_RECEITA_USUARIO_FK FOREIGN KEY ( cd_usuario )
        REFERENCES T_FNT_USUARIO ( cd_usuario )
            ON DELETE CASCADE;

CREATE SEQUENCE SQ_FNT_CODIGO MINVALUE 1 START WITH 1 INCREMENT BY 1;

////////////////////////////////////////////////////////////////////////////////////////////

ALTER TABLE T_FNT_GASTO
ADD ds_tipo_gasto VARCHAR2(20);

///////////////////////////////////////////////////////////////////////////////////////////
//Cadastro e alteração:

//Cadastrar os dados do usuário.

INSERT INTO T_FNT_USUARIO
    VALUES(1, 'NELSON', 'NELSINHO1234@GMAIL.COM', 45965197117,'rGgfdgr455!');
    

//Alterar todos os dados do usuário, utilizando seu código como referência.

UPDATE T_FNT_USUARIO
    SET nm_nome= 'RUBENS',
        ds_email= 'RUBINHO4321#GMAIL.COM',
        nr_telefone= '41976208228',
        ds_senha= 'DGFDGdgfsg34#'
        WHERE cd_usuario= 1;
    

//Cadastrar as receitas do usuário.

INSERT INTO T_FNT_RECEITA
    VALUES (1, 'SALARIO', 'RECORRENTE', 8550.80, TO_DATE('05/04/2024', 'DD/MM/YYYY'), 1);
    
    
INSERT INTO T_FNT_RECEITA
    VALUES (2, 'DIVIDENDO ACAO BANCO DO BRASIL', 'DIVIDENDO', 35.77, TO_DATE('27/03/2024', 'DD/MM/YYYY'), 1);

    
//Alterar todos os dados das receitas do usuário, utilizando o código como referência.

UPDATE T_FNT_RECEITA
    SET ds_receita= 'SALARIO',
        ds_categoria= 'SALARIO',
        vl_receita= 9476.40,
        dt_recebimento= TO_DATE('10/04/2024', 'DD/MM/YYYY')
        WHERE cd_receita= 1 AND cd_usuario= 1;


//Cadastrar as despesas do usuário.

INSERT INTO T_FNT_GASTO
    VALUES (1, 'ACADEMIA', 'GASTO RECORRENTE', 150, TO_DATE('14/04/2024','DD/MM/YYYY'),'CARTAO NUBANK',1, 1);

INSERT INTO T_FNT_GASTO
    VALUES (2, 'AMAZON PRIME', 'ASSINATURA STREAMING', 14.9, TO_DATE('04/04/2024','DD/MM/YYYY'),'CARTAO NUBANK',1, 1);
    
INSERT INTO T_FNT_GASTO
    VALUES (3, 'CONDOMINIO', 'CONTAS', 348.44, TO_DATE('10/04/2024','DD/MM/YYYY'),NULL ,NULL , 1);


//Alterar todos os dados das despesas do usuário, utilizando o código como referência.

UPDATE T_FNT_GASTO
    SET ds_gasto='NETFLIX',
        ds_categoria='STREAMING',
        vl_gasto= 39.9,
        dt_gasto= TO_DATE('27/03/2024','DD/MM/YYYY')
        WHERE cd_usuario=1 AND cd_gasto=2;


//Cadastrar os dados para investimentos.

INSERT INTO T_FNT_INVESTIMENTO
    VALUES (1, 'COMPRA', TO_DATE('10/04/2024','DD/MM/YYYY'), 'ACAO', 'BBAS3', 56.50,
    10, 565, NULL, 1);

INSERT INTO T_FNT_INVESTIMENTO
    VALUES (2, 'COMPRA', TO_DATE('20/02/2024','DD/MM/YYYY'), 'FII', 'HSML11', 96.95,
    5, 484.75, NULL, 1);
    
INSERT INTO T_FNT_INVESTIMENTO
    VALUES (3, 'COMPRA', TO_DATE('20/02/2024','DD/MM/YYYY'), 'RENDA FIXA', 'TESOURO DIRETO IPCA+', 1244.59,
    1, 1244.59, TO_DATE('15/05/2045','DD/MM/YYYY'), 1);


//Alterar todos os dados para investimentos do usuário, utilizando o código como referência.

UPDATE T_FNT_INVESTIMENTO
    SET ds_negociacao= 'COMPRA',
        dt_negociacao= TO_DATE('09/04/2024','DD/MM/YYYY'),
        ds_categoria= 'ACAO',
        nm_ativo= 'WEGE3',
        vl_preco_medio= 38,
        nr_quantidade= 20,
        vl_valor_investido= 760
        WHERE cd_negociacao= 2 AND cd_usuario=1;


    
    
////////////////////////////////////////////////////////////////////////////////
//Consultas:

//Consultar os dados de um usuário (filtrar a partir do seu código).

SELECT cd_usuario ,
    nm_nome ,
    ds_email ,
    nr_telefone ,
    ds_senha 
    FROM T_FNT_USUARIO
    WHERE cd_usuario= 1;

//Consultar os dados de um único registro de despesa de um  usuário (filtrar a partir do código do usuário e do código da despesa).

SELECT cd_gasto ,
    ds_gasto ,
    ds_categoria ,
    vl_gasto ,
    dt_gasto ,
    ds_cartao_credito ,
    nr_parcelas ,
    cd_usuario 
    FROM T_FNT_GASTO
    WHERE cd_usuario= 1 AND cd_gasto= 3;
    
    
//Consultar os dados de todos os registros de despesas de um  usuário, ordenando-os dos registros mais recentes para os mais antigos

SELECT cd_gasto ,
    ds_gasto ,
    ds_categoria ,
    vl_gasto ,
    dt_gasto ,
    ds_cartao_credito ,
    nr_parcelas ,
    cd_usuario 
    FROM T_FNT_GASTO
    WHERE cd_usuario=1
    ORDER BY dt_gasto DESC;
    
    
//Consultar os dados de um único registro de investimento de um  usuário

SELECT CD_NEGOCIACAO ,
        DS_NEGOCIACAO ,
        DT_NEGOCIACAO ,
        DS_CATEGORIA ,
        NM_ATIVO ,
        VL_PRECO_MEDIO ,
        NR_QUANTIDADE ,
        VL_VALOR_INVESTIDO ,
        DT_VENCIMENTO ,
        CD_USUARIO  
        FROM T_FNT_INVESTIMENTO
        WHERE cd_negociacao= 2 AND cd_usuario=1;


//Consultar os dados de todos os registros de investimentos de um  usuário, ordenando-os dos registros mais recentes para os mais antigos

SELECT CD_NEGOCIACAO ,
        DS_NEGOCIACAO ,
        DT_NEGOCIACAO ,
        DS_CATEGORIA ,
        NM_ATIVO ,
        VL_PRECO_MEDIO ,
        NR_QUANTIDADE ,
        VL_VALOR_INVESTIDO ,
        DT_VENCIMENTO ,
        CD_USUARIO  
        FROM T_FNT_INVESTIMENTO
        WHERE cd_usuario=1
        ORDER BY dt_negociacao DESC;


//Consultar os dados básicos de um usuário, o último investimento registrado e a última despesa registrada


SELECT U.NM_NOME "NOME",
        G.DT_GASTO  "ULTIMO GASTO",
        G.DS_GASTO  "GASTO",
        G.VL_GASTO  "VALOR",
        I.DT_NEGOCIACAO "ULTIMO INVESTIMENTO",
        I.NM_ATIVO  "ATIVO",
        I.DS_CATEGORIA  "CATEGORIA",
        I.VL_PRECO_MEDIO  "PRECO MEDIO",
        I.NR_QUANTIDADE  "QUANTIDADE",
        I.VL_VALOR_INVESTIDO   "TOTAL INVESTIDO"
           
    
    FROM T_FNT_USUARIO U INNER JOIN T_FNT_GASTO G
    ON (U.CD_USUARIO = G.CD_USUARIO)
    INNER JOIN T_FNT_INVESTIMENTO I
    ON (U.CD_USUARIO = I.CD_USUARIO)
    WHERE U.CD_USUARIO = 1
    AND G.DT_GASTO = (SELECT MAX(DT_GASTO) FROM T_FNT_GASTO)
    AND I.DT_NEGOCIACAO = (SELECT MAX(DT_NEGOCIACAO) FROM T_FNT_INVESTIMENTO);















