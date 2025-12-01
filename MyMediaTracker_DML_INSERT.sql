-- Script DML (Data Manipulation Language) - INSERT para popular o banco de dados MyMediaTracker

-- Inserção de dados na tabela TIPO_MIDIA
INSERT INTO TIPO_MIDIA (ID_Tipo, Nome_Tipo) VALUES
(1, 'Livro'),
(2, 'Jogo'),
(3, 'Música'),
(4, 'Anime');

-- Inserção de dados na tabela AUTOR_CRIADOR
INSERT INTO AUTOR_CRIADOR (ID_Criador, Nome_Criador) VALUES
(1, 'Frank Herbert'),
(2, 'CD Projekt Red'),
(3, 'Hajime Isayama'),
(4, 'Pink Floyd');

-- Inserção de dados na tabela GENERO
INSERT INTO GENERO (ID_Genero, Nome_Genero) VALUES
(1, 'Ficção Científica'),
(2, 'Fantasia'),
(3, 'RPG'),
(4, 'Ação'),
(5, 'Rock Progressivo'),
(6, 'Shonen');

-- Inserção de dados na tabela USUARIO
-- Senha_Hash é um valor fictício, pois a senha real seria criptografada.
INSERT INTO USUARIO (ID_Usuario, Nome, Email, Senha_Hash, Data_Cadastro) VALUES
(1, 'Guilherme Gomes', 'guilherme.gomes@example.com', 'hash_seguro_do_guilherme', '2024-01-10');

-- Inserção de dados na tabela ITEM_MIDIA
INSERT INTO ITEM_MIDIA (ID_Item, Titulo, Ano_Lancamento, Sinopse, ID_Tipo) VALUES
(1, 'Duna', 1965, 'A saga épica de Paul Atreides em Arrakis.', 1), -- Livro
(2, 'The Witcher 3: Wild Hunt', 2015, 'Um RPG de mundo aberto sobre Geralt de Rivia.', 2), -- Jogo
(3, 'Shingeki no Kyojin (Attack on Titan)', 2013, 'A humanidade luta contra titãs.', 4), -- Anime
(4, 'The Dark Side of the Moon', 1973, 'Álbum icônico de Pink Floyd.', 3); -- Música

-- Inserção de dados na tabela ITEM_GENERO (Associação N:M)
INSERT INTO ITEM_GENERO (ID_Item, ID_Genero) VALUES
(1, 1), -- Duna - Ficção Científica
(1, 2), -- Duna - Fantasia
(2, 3), -- The Witcher 3 - RPG
(2, 2), -- The Witcher 3 - Fantasia
(3, 4), -- Attack on Titan - Ação
(3, 6), -- Attack on Titan - Shonen
(4, 5); -- The Dark Side of the Moon - Rock Progressivo

-- Inserção de dados na tabela ITEM_AUTOR (Associação N:M)
INSERT INTO ITEM_AUTOR (ID_Item, ID_Criador) VALUES
(1, 1), -- Duna - Frank Herbert
(2, 2), -- The Witcher 3 - CD Projekt Red
(3, 3), -- Attack on Titan - Hajime Isayama
(4, 4); -- The Dark Side of the Moon - Pink Floyd

-- Inserção de dados na tabela ACOMPANHAMENTO
INSERT INTO ACOMPANHAMENTO (ID_Acompanhamento, Nota, Status, Data_Inicio, Data_Fim, ID_Usuario, ID_Item) VALUES
(1, 5, 'Lido', '2024-03-15', '2024-04-20', 1, 1), -- Duna: Lido, Nota 5
(2, 4, 'Finalizado', '2024-05-01', '2024-06-15', 1, 2), -- The Witcher 3: Finalizado, Nota 4
(3, NULL, 'Assistindo', '2024-07-01', NULL, 1, 3), -- Attack on Titan: Assistindo, Sem Nota
(4, 5, 'Ouvido', '2024-01-01', '2024-01-01', 1, 4); -- The Dark Side of the Moon: Ouvido, Nota 5
