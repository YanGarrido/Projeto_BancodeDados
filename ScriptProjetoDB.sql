CREATE DATABASE IF NOT EXISTS Igreja;
USE Igreja;

CREATE TABLE IF NOT EXISTS Membros (
id_membro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100),
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20),
endereço TEXT,
data_nascimento DATE,
data_entrada DATE
);

CREATE TABLE IF NOT EXISTS Ministerio (
id_ministerio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100),
descrição TEXT,
id_membro INT NOT NULL,
FOREIGN KEY (id_membro) REFERENCES Membros(id_membro)
);

CREATE TABLE IF NOT EXISTS locais (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    capacidade INT,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    id_local INT,
    id_tipo INT,
    FOREIGN KEY (id_local) REFERENCES locais(id_local),
    FOREIGN KEY (id_tipo) REFERENCES tipos_eventos(id_tipo)
);

CREATE TABLE IF NOT EXISTS reunioes (
    id_reuniao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    id_ministerio INT,
    id_local INT,
    id_tipo INT,
    FOREIGN KEY (id_ministerio) REFERENCES ministerio(id_ministerio),
    FOREIGN KEY (id_local) REFERENCES locais(id_local),
    FOREIGN KEY (id_tipo) REFERENCES tipos_reunioes(id_tipo)
);

