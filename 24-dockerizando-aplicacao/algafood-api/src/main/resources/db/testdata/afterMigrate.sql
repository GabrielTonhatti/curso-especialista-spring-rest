SET foreign_key_checks = 0;

LOCK TABLES
    cidade WRITE,
    cozinha WRITE,
    estado WRITE,
    forma_pagamento WRITE,
    grupo WRITE,
    grupo_permissao WRITE,
    permissao WRITE ,
    produto WRITE,
    restaurante WRITE , restaurante_forma_pagamento WRITE,
    restaurante_usuario_responsavel WRITE,
    usuario WRITE,
    usuario_grupo WRITE,
    pedido WRITE,
    item_pedido WRITE,
    foto_produto WRITE,
    oauth_client_details WRITE;

DELETE
FROM cidade;
DELETE
FROM cozinha;
DELETE
FROM estado;
DELETE
FROM forma_pagamento;
DELETE
FROM grupo;
DELETE
FROM grupo_permissao;
DELETE
FROM permissao;
DELETE
FROM produto;
DELETE
FROM restaurante;
DELETE
FROM restaurante_forma_pagamento;
DELETE
FROM usuario;
DELETE
FROM pedido;
DELETE
FROM item_pedido;
DELETE
FROM usuario_grupo;
DELETE
FROM restaurante_usuario_responsavel;
DELETE
FROM foto_produto;
DELETE
FROM oauth_client_details;

SET foreign_key_checks = 1;

ALTER TABLE cidade
    AUTO_INCREMENT = 1;
ALTER TABLE cozinha
    AUTO_INCREMENT = 1;
ALTER TABLE estado
    AUTO_INCREMENT = 1;
ALTER TABLE forma_pagamento
    AUTO_INCREMENT = 1;
ALTER TABLE grupo
    AUTO_INCREMENT = 1;
ALTER TABLE permissao
    AUTO_INCREMENT = 1;
ALTER TABLE produto
    AUTO_INCREMENT = 1;
ALTER TABLE restaurante
    AUTO_INCREMENT = 1;
ALTER TABLE usuario
    AUTO_INCREMENT = 1;
ALTER TABLE pedido
    AUTO_INCREMENT = 1;
ALTER TABLE item_pedido
    AUTO_INCREMENT = 1;

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

INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto,
                         endereco_cidade_id,
                         endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro)
VALUES (1, 'Thai Gourmet', 10, 1, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE, 1, '38400-999', 'Rua João Pinheiro', '1000',
        'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto)
VALUES (2, 'Thai Delivery', 9.50, 1, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto)
VALUES (3, 'Tuk Tuk Comida Indiana', 15, 2, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto)
VALUES (4, 'Java Steakhouse', 12, 3, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto)
VALUES (5, 'Lanchonete do Tio Sam', 11, 4, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto)
VALUES (6, 'Bar da Maria', 6, 4, UTC_TIMESTAMP, UTC_TIMESTAMP, TRUE, TRUE);

INSERT INTO forma_pagamento(id, descricao, data_atualizacao)
VALUES (1, 'Cartão de Crédito', UTC_TIMESTAMP);
INSERT INTO forma_pagamento (id, descricao, data_atualizacao)
VALUES (2, 'Cartão de Débito', UTC_TIMESTAMP);
INSERT INTO forma_pagamento (id, descricao, data_atualizacao)
VALUES (3, 'Dinheiro', UTC_TIMESTAMP);
INSERT INTO forma_pagamento(id, descricao, data_atualizacao)
VALUES (4, 'Pix', UTC_TIMESTAMP);

INSERT INTO permissao (id, nome, descricao)
VALUES (1, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO permissao (id, nome, descricao)
VALUES (2, 'EDITAR_FORMAS_PAGAMENTO', 'Permite criar ou editar formas de pagamento');
INSERT INTO permissao (id, nome, descricao)
VALUES (3, 'EDITAR_CIDADES', 'Permite criar ou editar cidades');
INSERT INTO permissao (id, nome, descricao)
VALUES (4, 'EDITAR_ESTADOS', 'Permite criar ou editar estados');
INSERT INTO permissao (id, nome, descricao)
VALUES (5, 'CONSULTAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite consultar usuários, grupos e permissões');
INSERT INTO permissao (id, nome, descricao)
VALUES (6, 'EDITAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite criar ou editar usuários, grupos e permissões');
INSERT INTO permissao (id, nome, descricao)
VALUES (7, 'EDITAR_RESTAURANTES', 'Permite criar, editar ou gerenciar restaurantes');
INSERT INTO permissao (id, nome, descricao)
VALUES (8, 'CONSULTAR_PEDIDOS', 'Permite consultar pedidos');
INSERT INTO permissao (id, nome, descricao)
VALUES (9, 'GERENCIAR_PEDIDOS', 'Permite gerenciar pedidos');
INSERT INTO permissao (id, nome, descricao)
VALUES (10, 'GERAR_RELATORIOS', 'Permite gerar relatórios');

INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 3),
       (3, 2),
       (3, 3);

INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id)
VALUES ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 0, 1);
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

INSERT INTO grupo(nome)
VALUES ('Gerente'),
       ('Vendedor'),
       ('Secretária'),
       ('Cadastrador');

INSERT INTO usuario (id, nome, email, senha, data_cadastro)
VALUES (1, 'João da Silva', 'joao.ger@algafood.com', '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m',
        UTC_TIMESTAMP),
       (2, 'Maria Joaquina', 'maria.vnd@algafood.com', '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m',
        UTC_TIMESTAMP),
       (3, 'José Souza', 'jose.aux@algafood.com', '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m',
        UTC_TIMESTAMP),
       (4, 'Sebastião Martins', 'sebastiao.cad@algafood.com',
        '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m', UTC_TIMESTAMP),
       (5, 'Manoel Lima', 'manoel.loja@gmail.com', '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m',
        UTC_TIMESTAMP),
       (6, 'Débora Mendonça', 'email.teste.aw12+debora@gmail.com',
        '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m', UTC_TIMESTAMP),
       (7, 'Carlos Lima', 'email.teste.aw12+carlos@gmail.com',
        '$2a$12$3UrwUt9SuRRkAvOtLqJKHe9IVXc1Q8fGDruKTrQ..XMPh/fEFfG5m', UTC_TIMESTAMP);

# Adiciona todas as permissoes no grupo do gerente
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 1, id
FROM permissao;

# Adiciona permissoes no grupo do vendedor
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 2, id
FROM permissao
WHERE nome LIKE 'CONSULTAR_%';

INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 2, id
FROM permissao
WHERE nome = 'EDITAR_RESTAURANTES';

# Adiciona permissoes no grupo do auxiliar
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 3, id
FROM permissao
WHERE nome LIKE 'CONSULTAR_%';

# Adiciona permissoes no grupo cadastrador
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 4, id
FROM permissao
WHERE nome LIKE '%_RESTAURANTES';

INSERT INTO usuario_grupo (usuario_id, grupo_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 3),
       (4, 4);

INSERT INTO restaurante_usuario_responsavel (restaurante_id, usuario_id)
VALUES (1, 5),
       (3, 5);

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id,
                    endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status,
                    data_criacao, subtotal, taxa_frete, valor_total)
VALUES (1, '7e75da8b-c101-11ec-a54b-0242ac110007', 1, 6, 1, 1, '38400-000', 'Rua Floriano Peixoto', '500', 'Apto 801',
        'Brasil',
        'CRIADO', UTC_TIMESTAMP, 298.90, 10, 308.90);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (1, 1, 1, 1, 78.9, 78.9, NULL);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (2, 1, 2, 2, 110, 220, 'Menos picante, por favor');

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id,
                    endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status,
                    data_criacao, subtotal, taxa_frete, valor_total)
VALUES (2, '76b94576-c101-11ec-a54b-0242ac110007', 4, 6, 2, 1, '38400-111', 'Rua Acre', '300', 'Casa 2', 'Centro',
        'CRIADO', UTC_TIMESTAMP, 79, 0, 79);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (3, 2, 6, 1, 79, 79, 'Ao ponto');

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id,
                    endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status,
                    data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
VALUES (3, 'b5741512-8fbc-47fa-9ac1-b530354fc0ff', 1, 7, 1, 1, '38400-222', 'Rua Natal', '200', NULL, 'Brasil',
        'ENTREGUE', '2019-10-30 21:10:00', '2019-10-30 21:10:45', '2019-10-30 21:55:44', 110, 10, 120);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (4, 3, 2, 1, 110, 110, NULL);

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id,
                    endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status,
                    data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
VALUES (4, '5c621c9a-ba61-4454-8631-8aabefe58dc2', 1, 7, 1, 1, '38400-800', 'Rua Fortaleza', '900', 'Apto 504',
        'Centro', 'ENTREGUE', '2019-11-02 20:34:04', '2019-11-02 20:35:10', '2019-11-02 21:10:32', 174.4, 5, 179.4);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (5, 4, 3, 2, 87.2, 174.4, NULL);

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id,
                    endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status,
                    data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
VALUES (5, '8d774bcf-b238-42f3-aef1-5fb388754d63', 2, 3, 2, 1, '38400-200', 'Rua 10', '930', 'Casa 20', 'Martins',
        'ENTREGUE', '2019-11-03 02:00:30', '2019-11-03 02:01:21', '2019-11-03 02:20:10', 87.2, 10, 97.2);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES (6, 5, 3, 1, 87.2, 87.2, NULL);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types,
                                  web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity,
                                  autoapprove)
VALUES ('algafood-web', NULL, '$2y$12$w3igMjsfS5XoAYuowoH3C.54vRFWlcXSHLjX7MwF990Kc2KKKh72e', 'READ,WRITE', 'password',
        NULL, NULL, 60 * 60 * 6, 60 * 24 * 60 * 60, NULL);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types,
                                  web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity,
                                  autoapprove)
VALUES ('foodanalytics', NULL, '$2y$12$fahbH37S2pyk1RPuIHKP.earzFmgAJJGo26rE.59vf4wwiiTKHnzO', 'READ,WRITE',
        'authorization_code', 'http://www.foodanalytics.local:8082', NULL, NULL, NULL, NULL);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types,
                                  web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity,
                                  autoapprove)
VALUES ('faturamento', NULL, '$2y$12$fHixriC7yXX/i1/CmpnGH.RFyK/l5YapLCFOEbIktONjE8ZDykSnu', 'READ,WRITE',
        'client_credentials', NULL, 'CONSULTAR_PEDIDOS,GERAR_RELATORIOS', NULL, NULL, NULL);

UNLOCK TABLES;