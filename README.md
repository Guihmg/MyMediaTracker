# MyMediaTracker - Criação e Manipulação de Dados com SQL

Este repositório contém os scripts SQL desenvolvidos para a **Atividade 4: Criação e Manipulação de Dados com SQL em Projeto Real (Mini-mundo)**, baseada no modelo lógico do sistema de gestão de coleção de mídia pessoal **MyMediaTracker**.

O objetivo desta atividade foi aplicar comandos da Linguagem de Manipulação de Dados (DML) do SQL para popular, consultar e modificar os dados do banco de dados, garantindo a integridade e respeitando as restrições de chaves e relacionamentos.

## Estrutura do Repositório

| Arquivo | Descrição | Tipo de Comando |
| :--- | :--- | :--- |
| `MyMediaTracker_DDL.sql` | Script de Definição de Dados (DDL) para criar as tabelas do banco de dados (`CREATE TABLE`). | DDL |
| `MyMediaTracker_DML_INSERT.sql` | Script de Manipulação de Dados (DML) para popular as tabelas principais com dados iniciais (`INSERT`). | DML |
| `MyMediaTracker_DML_SELECT.sql` | Script de Manipulação de Dados (DML) contendo 5 consultas complexas (`SELECT`). | DML |
| `MyMediaTracker_DML_UPDATE_DELETE.sql` | Script de Manipulação de Dados (DML) contendo 3 comandos de atualização (`UPDATE`) e 3 comandos de exclusão (`DELETE`) com condições. | DML |

## Instruções de Execução

Para executar os scripts SQL e recriar o ambiente do MyMediaTracker, siga os passos abaixo:

### Pré-requisitos

Você precisará de um sistema de gerenciamento de banco de dados relacional (SGBD) compatível com SQL padrão (como MySQL, PostgreSQL, SQL Server ou SQLite) e uma ferramenta de administração (como MySQL Workbench, pgAdmin ou DBeaver).

### Passo 1: Criação do Banco de Dados e das Tabelas (DDL)

1.  Abra sua ferramenta de administração de banco de dados.
2.  Crie um novo banco de dados vazio (ex: `MyMediaTracker_DB`).
3.  Execute o script `MyMediaTracker_DDL.sql`. Este script criará todas as 8 tabelas do modelo lógico: `TIPO_MIDIA`, `AUTOR_CRIADOR`, `GENERO`, `USUARIO`, `ITEM_MIDIA`, `ITEM_GENERO`, `ITEM_AUTOR` e `ACOMPANHAMENTO`, incluindo todas as chaves primárias e estrangeiras.

### Passo 2: Inserção de Dados Iniciais (DML - INSERT)

1.  Após a criação das tabelas, execute o script `MyMediaTracker_DML_INSERT.sql`.
2.  Este script irá popular as tabelas com dados de exemplo para o usuário "Guilherme Gomes" e quatro itens de mídia (Livro, Jogo, Anime, Música).

### Passo 3: Execução das Consultas (DML - SELECT)

1.  Execute o script `MyMediaTracker_DML_SELECT.sql`.
2.  Este script contém 5 consultas que demonstram a recuperação de dados usando cláusulas como `WHERE`, `ORDER BY`, `LIMIT`, `JOIN`, `GROUP BY` e subconsultas implícitas (N:M).

### Passo 4: Execução dos Comandos de Manipulação (DML - UPDATE e DELETE)

1.  Execute o script `MyMediaTracker_DML_UPDATE_DELETE.sql`.
2.  Este script contém 3 comandos `UPDATE` e 3 comandos `DELETE` com condições, que demonstram a manipulação de dados e a manutenção da integridade referencial.

---

**Observação:** O script `MyMediaTracker_DML_UPDATE_DELETE.sql` inclui comandos temporários de `INSERT` e `DELETE` para demonstrar a remoção de um item de mídia e um autor, garantindo que as operações de `DELETE` não afetem os dados principais usados nas consultas.

## Modelo Lógico (Resumo)

O modelo de dados é composto pelas seguintes tabelas e seus relacionamentos:

*   **Tabelas Principais:** `USUARIO`, `TIPO_MIDIA`, `AUTOR_CRIADOR`, `GENERO`, `ITEM_MIDIA`, `ACOMPANHAMENTO`.
*   **Tabelas Associativas (N:M):** `ITEM_GENERO` (Item de Mídia e Gênero) e `ITEM_AUTOR` (Item de Mídia e Autor/Criador).
*   **Relacionamento Chave:** A tabela `ACOMPANHAMENTO` conecta `USUARIO` e `ITEM_MIDIA`, registrando o status de consumo, nota e datas.

