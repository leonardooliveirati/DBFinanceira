use FinanceiraClientes
go

SELECT TOP 4 
	c.Nome
FROM Clientes c
	INNER JOIN Financiamentos f ON c.ClienteID = f.ClienteID
	INNER JOIN Parcelas p ON f.FinanciamentoID = p.FinanciamentoID
WHERE 
	p.DataVencimento > GETDATE() 
AND p.DataPagamento IS NULL;