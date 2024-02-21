use FinanceiraClientes

SELECT c.Nome, COUNT(p.ParcelaID) AS ParcelasPagas, COUNT(p.ParcelaID)*100.0/COUNT(*) AS PercentualPagas
FROM Clientes c
INNER JOIN Financiamentos f ON c.ClienteID = f.ClienteID
INNER JOIN Parcelas p ON f.FinanciamentoID = p.FinanciamentoID
WHERE c.UF = 'SP' AND p.DataPagamento IS NOT NULL
GROUP BY c.Nome
HAVING COUNT(p.ParcelaID)*100.0/COUNT(*) > 60;