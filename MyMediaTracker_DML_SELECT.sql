-- Script DML (Data Manipulation Language) - SELECT para consultas no banco de dados MyMediaTracker

-- 1. Consulta: Listar todos os itens de mídia que o usuário avaliou com nota 5 (JOIN e WHERE)
-- Objetivo: Mostrar o título do item e a nota, filtrando apenas as avaliações máximas.
SELECT
    im.Titulo,
    a.Nota
FROM
    ITEM_MIDIA im
JOIN
    ACOMPANHAMENTO a ON im.ID_Item = a.ID_Item
WHERE
    a.Nota = 5;

-- 2. Consulta: Contar quantos itens de mídia existem por tipo (JOIN e GROUP BY)
-- Objetivo: Obter um resumo da coleção, agrupado pelo tipo de mídia.
SELECT
    tm.Nome_Tipo,
    COUNT(im.ID_Item) AS Total_Itens
FROM
    ITEM_MIDIA im
JOIN
    TIPO_MIDIA tm ON im.ID_Tipo = tm.ID_Tipo
GROUP BY
    tm.Nome_Tipo
ORDER BY
    Total_Itens DESC;

-- 3. Consulta: Listar os itens de mídia que estão em progresso (Status 'Assistindo' ou 'Lendo'), ordenados pelo título (WHERE e ORDER BY)
-- Objetivo: Acompanhar o que está sendo consumido no momento.
SELECT
    im.Titulo,
    a.Status,
    a.Data_Inicio
FROM
    ITEM_MIDIA im
JOIN
    ACOMPANHAMENTO a ON im.ID_Item = a.ID_Item
WHERE
    a.Status IN ('Assistindo', 'Lendo')
ORDER BY
    im.Titulo ASC;

-- 4. Consulta: Listar todos os autores/criadores de itens de mídia do gênero 'Fantasia' (Múltiplos JOINs - N:M)
-- Objetivo: Encontrar criadores associados a um gênero específico.
SELECT DISTINCT
    ac.Nome_Criador
FROM
    AUTOR_CRIADOR ac
JOIN
    ITEM_AUTOR ia ON ac.ID_Criador = ia.ID_Criador
JOIN
    ITEM_GENERO ig ON ia.ID_Item = ig.ID_Item
JOIN
    GENERO g ON ig.ID_Genero = g.ID_Genero
WHERE
    g.Nome_Genero = 'Fantasia';

-- 5. Consulta: Listar os 2 itens de mídia mais antigos (menor ano de lançamento) (ORDER BY e LIMIT)
-- Objetivo: Identificar os itens mais antigos da coleção.
SELECT
    Titulo,
    Ano_Lancamento
FROM
    ITEM_MIDIA
ORDER BY
    Ano_Lancamento ASC
LIMIT 2;
