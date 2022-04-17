ALTER TABLE restaurante
    ADD COLUMN aberto TINYINT(1) NOT NULL;

UPDATE restaurante
SET aberto = FALSE;