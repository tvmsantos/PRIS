CREATE TABLE [imptblimoveis] (
	IDImovel smallint NOT NULL,
	IDProprietario smallint NOT NULL,
	IDTipoImovel smallint NOT NULL,
	NomeImovel varchar(255) NOT NULL,
	Endereco ntext NOT NULL,
	Bairro varchar(50) NOT NULL,
	CEP numeric(8) NOT NULL,
	Cidade varchar(50) NOT NULL,
	UF varchar(2) NOT NULL,
	Metragem numeric(10,2) NOT NULL,
	Quartos tinyint NOT NULL,
	Banheiros tinyint NOT NULL,
	Suites tinyint NOT NULL,
	VagasGaragem tinyint NOT NULL,
	ValorAluguel numeric(10,2) NOT NULL,
	ValorIPTU numeric(10,2) NOT NULL,
	OBS ntext NOT NULL,
  CONSTRAINT [PK_IMPTBLIMOVEIS] PRIMARY KEY CLUSTERED
  (
  [IDImovel] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [imptblclientes] (
	IDClientes smallint NOT NULL,
	NomeCliente varchar(50) NOT NULL,
	CPF numeric(15) NOT NULL,
	RG varchar(15) NOT NULL,
	EnderecoCompleto text NOT NULL,
	CEP numeric(8) NOT NULL,
	Telefone numeric(15) NOT NULL,
	EMail varchar(50) NOT NULL,
	DataNascimento date NOT NULL,
  CONSTRAINT [PK_IMPTBLCLIENTES] PRIMARY KEY CLUSTERED
  (
  [IDClientes] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [imptbltipoimoveis] (
	IDTipoImovel smallint NOT NULL,
	Descricao varchar(255) NOT NULL,
  CONSTRAINT [PK_IMPTBLTIPOIMOVEIS] PRIMARY KEY CLUSTERED
  (
  [IDTipoImovel] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [imptblprofissionais] (
	IDProfissional smallint NOT NULL,
	Nome varchar(45) NOT NULL,
	Profissao varchar(45) NOT NULL,
	Telefone numeric(15) NOT NULL,
	ValorHora numeric(10,2) NOT NULL,
	OBS text NOT NULL,
  CONSTRAINT [PK_IMPTBLPROFISSIONAIS] PRIMARY KEY CLUSTERED
  (
  [IDProfissional] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [imptbllocacao] (
	IDLocacao smallint NOT NULL,
	IDImovel smallint NOT NULL,
	IDInquilino smallint NOT NULL,
	IDAdvogado smallint NOT NULL,
	ValorAluguel numeric(10,4) NOT NULL,
	Periocidade varchar(10) NOT NULL,
	PercentualMulta numeric(5,2) NOT NULL,
	DiaVencimento tinyint NOT NULL,
	DataInicio date NOT NULL,
	DataFim date NOT NULL,
	Ativo bit NOT NULL,
  CONSTRAINT [PK_IMPTBLLOCACAO] PRIMARY KEY CLUSTERED
  (
  [IDLocacao] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [imptblimoveis] WITH CHECK ADD CONSTRAINT [imptblimoveis_fk0] FOREIGN KEY ([IDProprietario]) REFERENCES [imptblclientes]([IDClientes])
ON UPDATE CASCADE
GO
ALTER TABLE [imptblimoveis] CHECK CONSTRAINT [imptblimoveis_fk0]
GO
ALTER TABLE [imptblimoveis] WITH CHECK ADD CONSTRAINT [imptblimoveis_fk1] FOREIGN KEY ([IDTipoImovel]) REFERENCES [imptbltipoimoveis]([IDTipoImovel])
ON UPDATE CASCADE
GO
ALTER TABLE [imptblimoveis] CHECK CONSTRAINT [imptblimoveis_fk1]
GO




ALTER TABLE [imptbllocacao] WITH CHECK ADD CONSTRAINT [imptbllocacao_fk0] FOREIGN KEY ([IDImovel]) REFERENCES [imptblimoveis]([IDImovel])
ON UPDATE CASCADE
GO
ALTER TABLE [imptbllocacao] CHECK CONSTRAINT [imptbllocacao_fk0]
GO
ALTER TABLE [imptbllocacao] WITH CHECK ADD CONSTRAINT [imptbllocacao_fk1] FOREIGN KEY ([IDInquilino]) REFERENCES [imptblclientes]([IDClientes])
ON UPDATE CASCADE
GO
ALTER TABLE [imptbllocacao] CHECK CONSTRAINT [imptbllocacao_fk1]
GO
ALTER TABLE [imptbllocacao] WITH CHECK ADD CONSTRAINT [imptbllocacao_fk2] FOREIGN KEY ([IDAdvogado]) REFERENCES [imptblprofissionais]([IDProfissional])
ON UPDATE CASCADE
GO
ALTER TABLE [imptbllocacao] CHECK CONSTRAINT [imptbllocacao_fk2]
GO

