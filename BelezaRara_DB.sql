--- [1] DEFINIÇÃO DA ESTRUTURA DO BANCO (DDL) ---

-- Cria as tabelas baseadas no Modelo Lógico 3FN

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50), -- Ex: 'Em Separação', 'Enviado'
    id_cliente INT,
    -- Aplica a Chave Estrangeira (FK)
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Item_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2),
    -- Chave Primária composta pelas duas Chaves Estrangeiras
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

--- [2] POPULANDO AS TABELAS (INSERT DML) ---

-- Inserção de dados de clientes
INSERT INTO Cliente (nome, email, telefone) VALUES 
('Marine Macedo', 'marine@email.com', '98765-4321'),
('Sofia Almeida', 'sofia@email.com', '99111-2222'),
('Pedro Henrique', 'pedro@email.com', '99333-5555');

-- Inserção de itens no catálogo de produtos
INSERT INTO Produto (nome, preco, estoque) VALUES 
('Batom Matte', 35.00, 150),
('Base Líquida', 79.90, 80),
('Kit Pincéis', 120.00, 45);

-- Inserção de pedidos (registros de transações)
INSERT INTO Pedido (data_pedido, status, id_cliente) VALUES 
('2025-11-28', 'Enviado', 1), 
('2025-11-29', 'Em Separação', 2),
('2025-11-30', 'Aguardando Pagamento', 3); 

-- Detalhes dos produtos comprados em cada pedido
INSERT INTO Item_Pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES
(1, 1, 2, 35.00), -- Pedido 1: 2 Batons
(2, 2, 1, 79.90), -- Pedido 2: 1 Base
(2, 3, 1, 120.00), -- Pedido 2: 1 Kit Pincéis
(3, 1, 1, 35.00); -- Pedido 3: 1 Batom

--- [3] CONSULTAS E ANÁLISES (SELECT DML) ---

-- 3.1. Requisito JOIN: Busca o nome do cliente e a data dos pedidos com status 'Em Separação'.
SELECT C.nome, P.data_pedido
FROM Cliente C JOIN Pedido P ON C.id_cliente = P.id_cliente
WHERE P.status = 'Em Separação';

-- 3.2. Consulta Detalhada: Mostra a descrição e a quantidade dos itens comprados no Pedido de ID 2.
SELECT Pr.nome, IP.quantidade
FROM Produto Pr
JOIN Item_Pedido IP ON Pr.id_produto = IP.id_produto
WHERE IP.id_pedido = 2;

-- 3.3. Filtro Simples: Lista os produtos do catálogo com preço acima de R$ 100,00.
SELECT nome, preco, estoque FROM Produto WHERE preco > 100.00;

--- [4] MANIPULAÇÃO DE DADOS (UPDATE/DELETE DML) ---

-- 4.1. UPDATE: Corrigir o preço de um item específico no catálogo.
UPDATE Produto SET preco = 37.50 WHERE nome = 'Batom Matte';

-- 4.2. UPDATE: Atualiza o status do Pedido 3 de 'Aguardando Pagamento' para 'Cancelado'.
UPDATE Pedido SET status = 'Cancelado' WHERE id_pedido = 3;

-- 4.3. UPDATE: Aumentar o estoque global de todos os produtos para reposição.
UPDATE Produto SET estoque = estoque + 5;


-- 4.4. DELETE: Remoção dos detalhes do Pedido 3 (FOREIGN KEY exige esta ordem).
DELETE FROM Item_Pedido WHERE id_pedido = 3; 

-- 4.5. DELETE: Remoção do Pedido 3.
DELETE FROM Pedido WHERE id_pedido = 3;

-- 4.6. DELETE: Remoção do cliente Pedro Henrique.
DELETE FROM Cliente WHERE nome = 'Pedro Henrique';