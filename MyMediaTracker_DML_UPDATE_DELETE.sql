-- Script DML (Data Manipulation Language) - UPDATE e DELETE com condições

-- --------------------------------------------------------------------------------
-- COMANDOS UPDATE (Mínimo de 3)
-- --------------------------------------------------------------------------------

-- 1. UPDATE: Atualizar o status de um item que está 'Assistindo' para 'Completo' e registrar a Data_Fim.
-- Condição: ID_Item = 3 (Shingeki no Kyojin) E Status = 'Assistindo'
UPDATE ACOMPANHAMENTO
SET
    Status = 'Completo',
    Data_Fim = '2024-07-20',
    Nota = 5 -- Adicionando a nota que estava NULL
WHERE
    ID_Item = 3 AND Status = 'Assistindo';

-- 2. UPDATE: Corrigir o ano de lançamento de um item de mídia.
-- Condição: Titulo = 'Duna'
UPDATE ITEM_MIDIA
SET
    Ano_Lancamento = 1966 -- Exemplo de correção
WHERE
    Titulo = 'Duna';

-- 3. UPDATE: Alterar o nome de um gênero.
-- Condição: Nome_Genero = 'Rock Progressivo'
UPDATE GENERO
SET
    Nome_Genero = 'Rock Progressivo Clássico'
WHERE
    Nome_Genero = 'Rock Progressivo';

-- --------------------------------------------------------------------------------
-- COMANDOS DELETE (Mínimo de 3)
-- --------------------------------------------------------------------------------

-- 1. DELETE: Remover um item de mídia que não está sendo acompanhado (apenas um item que não está na tabela ACOMPANHAMENTO).
-- Nota: Para este exemplo, vamos INSERIR um item temporário e depois DELETÁ-LO.
INSERT INTO TIPO_MIDIA (ID_Tipo, Nome_Tipo) VALUES (5, 'Série');
INSERT INTO ITEM_MIDIA (ID_Item, Titulo, Ano_Lancamento, Sinopse, ID_Tipo) VALUES (5, 'The Mandalorian', 2019, 'Série de Star Wars.', 5);

DELETE FROM ITEM_MIDIA
WHERE
    Titulo = 'The Mandalorian';

DELETE FROM TIPO_MIDIA
WHERE
    ID_Tipo = 5;

-- 2. DELETE: Remover um autor/criador que não está mais associado a nenhum item (após a remoção do item temporário, o criador temporário também deve ser removido, mas vamos usar um exemplo que não afete os dados principais).
-- Condição: ID_Criador = 4 (Pink Floyd)
-- Nota: Em um sistema real, isso exigiria a remoção da associação em ITEM_AUTOR primeiro.
-- Para fins de demonstração, vamos assumir que a integridade referencial foi tratada ou que o autor não tem mais itens.
-- Vamos deletar um criador temporário:
INSERT INTO AUTOR_CRIADOR (ID_Criador, Nome_Criador) VALUES (5, 'Autor Temporário');

DELETE FROM AUTOR_CRIADOR
WHERE
    Nome_Criador = 'Autor Temporário';

-- 3. DELETE: Remover um registro de acompanhamento (por exemplo, se o usuário decidir que não quer mais rastrear um item).
-- Condição: ID_Item = 4 (The Dark Side of the Moon) E Nota = 5
DELETE FROM ACOMPANHAMENTO
WHERE
    ID_Item = 4 AND Nota = 5;
