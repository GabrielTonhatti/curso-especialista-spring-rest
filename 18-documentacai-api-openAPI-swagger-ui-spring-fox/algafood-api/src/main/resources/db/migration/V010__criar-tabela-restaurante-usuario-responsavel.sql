CREATE TABLE restaurante_usuario_responsavel
(
    restaurante_id BIGINT NOT NULL,
    usuario_id     BIGINT NOT NULL,

    PRIMARY KEY (usuario_id, restaurante_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE restaurante_usuario_responsavel
    ADD CONSTRAINT fk_restaurante_usuario_restaurante
        FOREIGN KEY (restaurante_id)
            REFERENCES restaurante (id);

ALTER TABLE restaurante_usuario_responsavel
    ADD CONSTRAINT fk_restaurante_usuario_usuario
        FOREIGN KEY (usuario_id)
            REFERENCES usuario (id);
