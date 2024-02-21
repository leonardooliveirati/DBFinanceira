use FinanceiraClientes
go 
-- Inserindo registros de teste para clientes
INSERT INTO Clientes (ClienteID, Nome, CPF, UF, Celular)
VALUES 
(1, 'João Silva', '12345678901', 'SP', '11987654321'),
(2, 'Maria Souza', '98765432109', 'RJ', '21987654321'),
(3, 'Carlos Santos', '45678901234', 'SP', '11976543210');

-- Inserindo registros de teste para financiamentos
INSERT INTO Financiamentos (FinanciamentoID, ClienteID, TipoFinanciamento, ValorTotal, DataUltimoVencimento)
VALUES
(1, 1, 'Empréstimo', 5000.00, '2024-03-15'),
(2, 1, 'Financiamento Imobiliário', 100000.00, '2025-06-20'),
(3, 2, 'Financiamento de Carro', 30000.00, '2024-08-10');

-- Inserindo registros de teste para parcelas
INSERT INTO Parcelas (ParcelaID, FinanciamentoID, NumeroParcela, ValorParcela, DataVencimento, DataPagamento)
VALUES
(1, 1, 1, 1000.00, '2024-01-15', '2024-01-10'),
(2, 1, 2, 1000.00, '2024-02-15', '2024-02-10'),
(3, 1, 3, 1000.00, '2024-03-15', NULL),
(4, 2, 1, 2000.00, '2024-01-20', '2024-01-20'),
(5, 2, 2, 2000.00, '2024-02-20', '2024-02-20'),
(6, 2, 3, 2000.00, '2024-03-20', NULL),
(7, 3, 1, 1000.00, '2024-01-10', '2024-01-10'),
(8, 3, 2, 1000.00, '2024-02-10', '2024-02-10');