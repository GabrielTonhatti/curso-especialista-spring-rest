INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');

INSERT INTO restaurante (nome, taxa_frete, cozinha_id) VALUES ('Thai Gourmet', 10, 1);
INSERT INTO restaurante (nome, taxa_frete, cozinha_id) VALUES ('Thai Delivery', 9.50, 1);
INSERT INTO restaurante (nome, taxa_frete, cozinha_id) VALUES ('Tuk Tuk Comida Indiana', 15, 2);

INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');
INSERT INTO estado (id, nome) VALUES (4, 'Rio de Janeiro');

INSERT INTO cidade (id, nome, estado_id) VALUES (1,'Franca', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (2,'Ribeirão Preto', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (3,'Minas Gerais', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Rio de Janeiro', 4);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (6, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (7, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (8, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (9, 'Fortaleza', 3);

INSERT INTO forma_pagamento(id,descricao) VALUES (1, 'Pix');
INSERT INTO forma_pagamento(id,descricao) VALUES (2, 'Boleto');
INSERT INTO forma_pagamento(id, descricao) VALUES (3, 'Cartão de Crédito');
INSERT INTO forma_pagamento (id, descricao) VALUES (4, 'Cartão de débito');
INSERT INTO forma_pagamento (id, descricao) VALUES (5, 'Dinheiro');

INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');