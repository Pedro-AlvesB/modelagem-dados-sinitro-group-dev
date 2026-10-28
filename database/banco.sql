CREATE DATABASE bajulador_simulator
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE bajulador_simulator;

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuario_email UNIQUE (email)
);

CREATE TABLE bajulador (
    id_bajulador INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200) NULL,
    icone VARCHAR(255) NULL,
    numero_slot INT NOT NULL,
    id_usuario INT NOT NULL,

    CONSTRAINT pk_bajulador PRIMARY KEY (id_bajulador),
    CONSTRAINT ck_bajulador_slot CHECK (numero_slot BETWEEN 1 AND 3),
    CONSTRAINT uq_bajulador_usuario_slot UNIQUE (id_usuario, numero_slot),
    CONSTRAINT fk_bajulador_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE CASCADE
);


-- ---------------------------------------------------------------------
-- CATEGORIA
-- ---------------------------------------------------------------------
CREATE TABLE categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT uq_categoria_nome UNIQUE (nome)
);


-- ---------------------------------------------------------------------
-- BAJULADOR_CATEGORIA
-- Relacionamento "pertence": bajulador (0,n) <-> categoria (0,n)
-- Tabela associativa do N:N. É também a agregação à qual a fala se liga.
-- ---------------------------------------------------------------------
CREATE TABLE bajulador_categoria (
    id_bajulador INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT pk_bajulador_categoria PRIMARY KEY (id_bajulador, id_categoria),
    CONSTRAINT fk_bc_bajulador
        FOREIGN KEY (id_bajulador) REFERENCES bajulador (id_bajulador)
        ON DELETE CASCADE,
    CONSTRAINT fk_bc_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
        ON DELETE CASCADE
);

CREATE TABLE fala (
    id_fala INT NOT NULL AUTO_INCREMENT,
    texto VARCHAR(500) NOT NULL,
    id_bajulador INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT pk_fala PRIMARY KEY (id_fala),
    CONSTRAINT fk_fala_bajulador_categoria
        FOREIGN KEY (id_bajulador, id_categoria)
        REFERENCES bajulador_categoria (id_bajulador, id_categoria)
        ON DELETE CASCADE
);

INSERT INTO categoria (nome)
VALUES
    ('Corporativo'),
    ('Relacionamento'),
    ('Amizade');