CREATE DATABASE bajulador_simulator;

USE bajulador_simulator;


-- Tabela de usuários
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela dos bajuladores
CREATE TABLE bajulador (
    id_bajulador SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    icone VARCHAR(255), -- é varchar sim, maximo q a memoria consegue ocupar
    numero_slot INT NOT NULL CHECK (numero_slot BETWEEN 1 AND 3),
    id_usuario INT NOT NULL,

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

-- Tabela de categorias
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela associativa entre bajuladores e categorias cardinalidade muitos para muitos
CREATE TABLE bajulador_categoria (
    id_bajulador INT NOT NULL,
    id_categoria INT NOT NULL,

    PRIMARY KEY (id_bajulador, id_categoria),

    FOREIGN KEY (id_bajulador)
        REFERENCES bajulador(id_bajulador)
        ON DELETE CASCADE,

    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
        ON DELETE CASCADE
);

-- Tabela das falas
CREATE TABLE fala (
    id_fala SERIAL PRIMARY KEY,
    texto VARCHAR(500) NOT NULL,
    id_bajulador INT NOT NULL,
    id_categoria INT NOT NULL,

    FOREIGN KEY (id_bajulador, id_categoria)
        REFERENCES bajulador_categoria(id_bajulador, id_categoria)
        ON DELETE CASCADE
);

-- Inserindo as categorias iniciais
INSERT INTO categoria (nome)
VALUES
    ('Corporativo'),
    ('Relacionamento'),
    ('Amizade');
