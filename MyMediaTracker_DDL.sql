-- Script DDL (Data Definition Language) para o banco de dados MyMediaTracker

-- 1. Tabela TIPO_MIDIA
CREATE TABLE TIPO_MIDIA (
    ID_Tipo INT PRIMARY KEY,
    Nome_Tipo VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Tabela AUTOR_CRIADOR
CREATE TABLE AUTOR_CRIADOR (
    ID_Criador INT PRIMARY KEY,
    Nome_Criador VARCHAR(100) NOT NULL
);

-- 3. Tabela GENERO
CREATE TABLE GENERO (
    ID_Genero INT PRIMARY KEY,
    Nome_Genero VARCHAR(50) NOT NULL UNIQUE
);

-- 4. Tabela USUARIO
CREATE TABLE USUARIO (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha_Hash VARCHAR(255) NOT NULL,
    Data_Cadastro DATE NOT NULL
);

-- 5. Tabela ITEM_MIDIA
CREATE TABLE ITEM_MIDIA (
    ID_Item INT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Ano_Lancamento INT,
    Sinopse TEXT,
    ID_Tipo INT NOT NULL,
    FOREIGN KEY (ID_Tipo) REFERENCES TIPO_MIDIA(ID_Tipo)
);

-- 6. Tabela ITEM_GENERO (Tabela Associativa N:M entre ITEM_MIDIA e GENERO)
CREATE TABLE ITEM_GENERO (
    ID_Item INT NOT NULL,
    ID_Genero INT NOT NULL,
    PRIMARY KEY (ID_Item, ID_Genero),
    FOREIGN KEY (ID_Item) REFERENCES ITEM_MIDIA(ID_Item),
    FOREIGN KEY (ID_Genero) REFERENCES GENERO(ID_Genero)
);

-- 7. Tabela ITEM_AUTOR (Tabela Associativa N:M entre ITEM_MIDIA e AUTOR_CRIADOR)
CREATE TABLE ITEM_AUTOR (
    ID_Item INT NOT NULL,
    ID_Criador INT NOT NULL,
    PRIMARY KEY (ID_Item, ID_Criador),
    FOREIGN KEY (ID_Item) REFERENCES ITEM_MIDIA(ID_Item),
    FOREIGN KEY (ID_Criador) REFERENCES AUTOR_CRIADOR(ID_Criador)
);

-- 8. Tabela ACOMPANHAMENTO
CREATE TABLE ACOMPANHAMENTO (
    ID_Acompanhamento INT PRIMARY KEY,
    Nota INT CHECK (Nota BETWEEN 1 AND 5),
    Status VARCHAR(50) NOT NULL, -- Ex: Lendo, Lido, Jogando, Finalizado, Assistindo, Completo
    Data_Inicio DATE,
    Data_Fim DATE,
    ID_Usuario INT NOT NULL,
    ID_Item INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario),
    FOREIGN KEY (ID_Item) REFERENCES ITEM_MIDIA(ID_Item)
);
