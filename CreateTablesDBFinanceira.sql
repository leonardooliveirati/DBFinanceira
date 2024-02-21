CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome NVARCHAR(100),
    CPF CHAR(11),
    UF CHAR(2),
    Celular VARCHAR(20)
);

CREATE TABLE Financiamentos (
    FinanciamentoID INT PRIMARY KEY,
    ClienteID INT,
    TipoFinanciamento NVARCHAR(100),
    ValorTotal DECIMAL(18, 2),
    DataUltimoVencimento DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Parcelas (
    ParcelaID INT PRIMARY KEY,
    FinanciamentoID INT,
    NumeroParcela INT,
    ValorParcela DECIMAL(18, 2),
    DataVencimento DATE,
    DataPagamento DATE,
    FOREIGN KEY (FinanciamentoID) REFERENCES Financiamentos(FinanciamentoID)
);