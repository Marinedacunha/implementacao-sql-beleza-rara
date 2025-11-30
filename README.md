# PROJETO SQL: IMPLEMENTAÇÃO DO E-COMMERCE DE COSMÉTICOS

## 1. Visão Geral do Projeto

Este repositório contém os scripts SQL desenvolvidos para a *Experiência Prática IV* da disciplina de Modelagem de Banco de Dados. O projeto visa implementar o Modelo Lógico de um sistema de vendas online de cosméticos, denominado *"Beleza Rara"*.

O foco principal é a demonstração de um modelo relacional normalizado (3FN) pronto para a produção.

---

## 2. Estrutura do Modelo Lógico

O banco de dados é baseado em um modelo de *4 tabelas* que resolve o relacionamento Múltiplo-Múltiplo (N:N) entre PEDIDO e PRODUTO através da tabela associativa ITEM_PEDIDO.

| Tabela | Função | Chaves |
| :--- | :--- | :--- |
| *CLIENTE* | Registro dos usuários. | PK |
| *PRODUTO* | Catálogo de itens e controle de estoque. | PK |
| *PEDIDO* | Registro das transações de compra. | PK, FK (id_cliente) |
| *ITEM_PEDIDO* | Tabela de ligação (Rompe o N:N). | PK Composta (id_pedido, id_produto) |

---

## 3. Conteúdo e Execução

O arquivo principal para avaliação é o **beleza_rara_script.sql**.

### 3.1. Conteúdo do Script

O script está organizado em quatro seções principais:

* *DDL (CREATE TABLE):* Criação das tabelas e definição da integridade referencial (FOREIGN KEY).
* *INSERT:* População das tabelas com dados de exemplo (clientes, produtos, pedidos).
* *SELECT (Consultas):* Demonstração do uso de JOIN para consulta entre tabelas (requisito da atividade).
* *UPDATE / DELETE:* Demonstração da manipulação de dados, respeitando as restrições de chaves estrangeiras.

### 3.2. Instruções

Para executar o projeto, carregue o arquivo beleza_rara_script.sql em qualquer SGBD (Sistema Gerenciador de Banco de Dados) Relacional (como MySQL ou PostgreSQL) e execute o script na ordem sequencial dos comandos.
