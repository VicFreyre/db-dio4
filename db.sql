-- Tabela Cliente
CREATE TABLE Cliente (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(150)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    placa CHAR(7) PRIMARY KEY,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    ano INT,
    cor VARCHAR(30),
    cpf_cliente CHAR(11),
    FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

-- Tabela Equipe
CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabela Mecânico
CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    especialidade VARCHAR(100),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

-- Tabela Ordem de Serviço
CREATE TABLE Ordem_Servico (
    id_os INT PRIMARY KEY,
    data_abertura DATE,
    data_entrega DATE,
    status VARCHAR(20),
    autorizada BOOLEAN,
    placa_veiculo CHAR(7),
    id_equipe INT,
    FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

-- Tabela Serviço
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR(200),
    valor_mao_obra DECIMAL(10,2)
);

-- Tabela Peça
CREATE TABLE Peca (
    id_peca INT PRIMARY KEY,
    nome VARCHAR(100),
    valor DECIMAL(10,2)
);

-- Tabela OS_Servico (N:N entre Ordem de Serviço e Serviço)
CREATE TABLE OS_Servico (
    id_os INT,
    id_servico INT,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- Tabela OS_Peca (N:N entre Ordem de Serviço e Peça)
CREATE TABLE OS_Peca (
    id_os INT,
    id_peca INT,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
