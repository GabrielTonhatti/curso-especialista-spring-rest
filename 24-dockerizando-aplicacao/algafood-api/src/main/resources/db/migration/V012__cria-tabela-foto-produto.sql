CREATE TABLE foto_produto
(
    produto_id   BIGINT       NOT NULL,
    nome_arquivo VARCHAR(150) NOT NULL,
    descricao    VARCHAR(150) NOT NULL,
    content_type VARCHAR(80)  NOT NULL,
    tamanho      INT          NOT NULL,

    PRIMARY KEY (produto_id),
    CONSTRAINT fk_foto_produto FOREIGN KEY (produto_id) REFERENCES produto (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;