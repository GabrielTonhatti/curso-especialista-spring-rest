CREATE TABLE cidade
(
    id        BIGINT       NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(255) NOT NULL ,
    estado_id BIGINT       NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE cozinha
(
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE estado
(
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE forma_pagamento
(
    id        BIGINT       NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE grupo
(
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE grupo_permissao
(
    grupo_id     BIGINT NOT NULL ,
    permissao_id BIGINT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE permissao
(
    id        BIGINT       NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL ,
    nome      VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE produto
(
    id             BIGINT         NOT NULL AUTO_INCREMENT,
    ativo          BIT            NOT NULL ,
    descricao      VARCHAR(255)   NOT NULL ,
    nome           VARCHAR(255)   NOT NULL ,
    preco          DECIMAL(19, 2) NOT NULL ,
    restaurante_id BIGINT         NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE restaurante
(
    id                   BIGINT         NOT NULL AUTO_INCREMENT,
    data_atualizacao     DATETIME       NOT NULL ,
    data_cadastro        DATETIME       NOT NULL ,
    endereco_bairro      VARCHAR(255),
    endereco_cep         VARCHAR(255),
    endereco_complemento VARCHAR(255),
    endereco_logradouro  VARCHAR(255),
    endereco_numero      VARCHAR(255),
    nome                 VARCHAR(255)   NOT NULL ,
    taxa_frete           DECIMAL(19, 2) NOT NULL ,
    cozinha_id           BIGINT         NOT NULL ,
    endereco_cidade_id   BIGINT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE restaurante_forma_pagamento
(
    restaurante_id     BIGINT NOT NULL ,
    forma_pagamento_id BIGINT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE usuario
(
    id            BIGINT       NOT NULL AUTO_INCREMENT,
    data_cadastro DATETIME     NOT NULL ,
    email         VARCHAR(255) NOT NULL ,
    nome          VARCHAR(255) NOT NULL ,
    senha         VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE usuario_grupo
(
    usuario_id BIGINT NOT NULL ,
    grupo_id   BIGINT NOT NULL
) ENGINE = InnoDB;

ALTER TABLE cidade
    ADD CONSTRAINT FKkworrwk40xj58kevvh3evi500
        FOREIGN KEY (estado_id)
            REFERENCES estado (id);

ALTER TABLE grupo_permissao
    ADD CONSTRAINT FKh21kiw0y0hxg6birmdf2ef6vy
        FOREIGN KEY (permissao_id)
            REFERENCES permissao (id);

ALTER TABLE grupo_permissao
    ADD CONSTRAINT FKta4si8vh3f4jo3bsslvkscc2m
        FOREIGN KEY (grupo_id)
            REFERENCES grupo (id);

ALTER TABLE produto
    ADD CONSTRAINT FKb9jhjyghjcn25guim7q4pt8qx
        FOREIGN KEY (restaurante_id)
            REFERENCES restaurante (id);

ALTER TABLE restaurante
    ADD CONSTRAINT FK76grk4roudh659skcgbnanthi
        FOREIGN KEY (cozinha_id)
            REFERENCES cozinha (id);

ALTER TABLE restaurante
    ADD CONSTRAINT FKbc0tm7hnvc96d8e7e2ulb05yw
        FOREIGN KEY (endereco_cidade_id)
            REFERENCES cidade (id);

ALTER TABLE restaurante_forma_pagamento
    ADD CONSTRAINT FK7aln770m80358y4olr03hyhh2
        FOREIGN KEY (forma_pagamento_id)
            REFERENCES forma_pagamento (id);

ALTER TABLE restaurante_forma_pagamento
    ADD CONSTRAINT FKa30vowfejemkw7whjvr8pryvj
        FOREIGN KEY (restaurante_id)
            REFERENCES restaurante (id);

ALTER TABLE usuario_grupo
    ADD CONSTRAINT FKk30suuy31cq5u36m9am4om9ju
        FOREIGN KEY (grupo_id)
            REFERENCES grupo (id);

ALTER TABLE usuario_grupo
    ADD CONSTRAINT FKdofo9es0esuiahyw2q467crxw
        FOREIGN KEY (usuario_id)
            REFERENCES usuario (id);

INSERT INTO cozinha (id, nome)
VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome)
VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome)
VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome)
VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome)
VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome)
VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome)
VALUES (3, 'Ceará');
INSERT INTO estado (id, nome)
VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id)
VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id)
VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id)
VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id)
VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id)
VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id)
VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id)
VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id)
VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id)
VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id,
                         endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro)
VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao)
VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao)
VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao)
VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao)
VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao)
VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao)
VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao)
VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao)
VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao)
VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao)
VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao)
VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 3),
       (3, 2),
       (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Salada picante com carne grelhada',
        'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20,
        1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé',
        79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('T-Bone',
        'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89,
        1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);

    create table cidade (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        estado_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table cozinha (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table estado (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table forma_pagamento (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo (
       id bigint not null auto_increment,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table grupo_permissao (
       grupo_id bigint not null,
        permissao_id bigint not null
    ) engine=InnoDB;

    create table permissao (
       id bigint not null auto_increment,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table produto (
       id bigint not null auto_increment,
        ativo bit not null,
        descricao varchar(255) not null,
        nome varchar(255) not null,
        preco decimal(19,2) not null,
        restaurante_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante (
       id bigint not null auto_increment,
        data_atualizacao datetime not null,
        data_cadastro datetime not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete decimal(19,2) not null,
        cozinha_id bigint not null,
        endereco_cidade_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table restaurante_forma_pagamento (
       restaurante_id bigint not null,
        forma_pagamento_id bigint not null
    ) engine=InnoDB;

    create table usuario (
       id bigint not null auto_increment,
        data_cadastro datetime not null,
        email varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table usuario_grupo (
       usuario_id bigint not null,
        grupo_id bigint not null
    ) engine=InnoDB;

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado (id);

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao (id);

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo (id);

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha (id);

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade (id);

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento (id);

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante (id);

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo (id);

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario (id);
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');
INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Rio de Janeiro', 4);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) VALUES (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) VALUES (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
INSERT INTO forma_pagamento(id, descricao) VALUES (1, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (2, 'Cartão de Débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (3, 'Dinheiro');
INSERT INTO forma_pagamento(id, descricao) VALUES (4, 'Pix');
INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) VALUES (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
