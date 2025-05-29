DROP TABLE t_conta CASCADE CONSTRAINTS;
DROP TABLE t_transacao CASCADE CONSTRAINTS;
DROP TABLE t_poupanca CASCADE CONSTRAINTS;

-- TABELA CONTA
CREATE TABLE t_conta (
    id_conta INTEGER GENERATED ALWAYS AS IDENTITY,
    nm_conta VARCHAR(55) NOT NULL,
    email_conta VARCHAR2(55) NOT NULL,
    hs_senha_conta VARCHAR2(32) NOT NULL
);

-- PRIMARY KEY CONTA
ALTER TABLE t_conta 
    ADD CONSTRAINT pk_conta PRIMARY KEY (id_conta);
    
-- TABELA TRANSAÇÃO
CREATE TABLE t_transacao (
    id_transacao INTEGER GENERATED ALWAYS AS IDENTITY,
    nm_transacao VARCHAR2(55) NOT NULL,
    tp_transacao VARCHAR2(10) NOT NULL,
    vl_transacao FLOAT NOT NULL,
    desc_transacao VARCHAR2(255) NULL,
    criado_em VARCHAR2(55) NOT NULL,
    f_cnt_id_conta INTEGER NOT NULL
);

-- PRIMARY KEY TRANSAÇÃO
ALTER TABLE t_transacao
    ADD CONSTRAINT pk_transacao PRIMARY KEY (id_transacao);

-- TABELA INVESTIMENTO 
CREATE TABLE t_poupanca (
    id_poupanca INTEGER GENERATED ALWAYS AS IDENTITY,
    desc_poupanca VARCHAR2(255) NULL,
    sld_poupanca FLOAT NOT NULL,
    criado_em VARCHAR2(55) NOT NULL,
    f_cnt_id_conta INTEGER NOT NULL
);

-- PRIMARY KEY POUPANÇA
ALTER TABLE t_poupanca
    ADD CONSTRAINT pk_poupanca PRIMARY KEY (id_poupanca);
            
-- CHAVE ESTRANGEIRA TRANSAÇÃO
ALTER TABLE t_transacao
    ADD CONSTRAINT fk_trns_cnt_id_conta
        FOREIGN KEY (f_cnt_id_conta)
            REFERENCES t_conta (id_conta);
    
-- CHAVE ESTRANGEIRA INVESTIMENTO 
ALTER TABLE t_poupanca 
    ADD CONSTRAINT fk_pou_cnt_id_conta
        FOREIGN KEY (f_cnt_id_conta)
            REFERENCES t_conta (id_conta);
            
COMMIT;
ROLLBACK;