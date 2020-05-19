-- tables
-- Table: Cargo_funcionario
CREATE TABLE Cargo_funcionario (
    cod_cargo number(9)  NOT NULL,
    cargo varchar2(100)  NULL,
    salario float(12)  NULL,
    CONSTRAINT Cargo_funcionario_pk PRIMARY KEY (cod_cargo)
) ;

-- Table: Clientes
CREATE TABLE Clientes (
    cod_clientes number(9)  NOT NULL,
    nome varchar2(100)  NULL,
    cpf number(11)  NULL,
    data_nascimento number(8)  NULL,
    genero varchar2(1)  NULL,
    endereco varchar2(100)  NULL,
    telefone number(11)  NULL,
    email varchar2(100)  NULL,
    CONSTRAINT Clientes_pk PRIMARY KEY (cod_clientes)
) ;

-- Table: Compras
CREATE TABLE Compras (
    cod_compras number(9)  NOT NULL,
    valor_total float(8)  NULL,
    data_atual number(8)  NULL,
    cod_funcionario number(9)  NOT NULL,
    cod_clientes number(9)  NOT NULL,
    CONSTRAINT Compras_pk PRIMARY KEY (cod_compras)
) ;

-- Table: Fornecedores
CREATE TABLE Fornecedores (
    cod_fornecedores number(9)  NOT NULL,
    razao_socil varchar2(100)  NULL,
    nome_fantasia varchar2(100)  NULL,
    cnpj number(14)  NULL,
    endereco varchar2(100)  NULL,
    telefone number(11)  NULL,
    CONSTRAINT Fornecedores_pk PRIMARY KEY (cod_fornecedores)
) ;

-- Table: Funcionario
CREATE TABLE Funcionario (
    cod_funcionario number(9)  NOT NULL,
    nome varchar2(100)  NULL,
    cargo varchar2(100)  NULL,
    cpf number(11)  NULL,
    endereco varchar2(100)  NULL,
    telefone number(11)  NULL,
    email varchar2(100)  NULL,
    cod_cargo number(9)  NOT NULL,
    CONSTRAINT Funcionario_pk PRIMARY KEY (cod_funcionario)
) ;

-- Table: Pet
CREATE TABLE Pet (
    cod_pet number(9)  NOT NULL,
    nome varchar2(100)  NULL,
    especie varchar2(100)  NOT NULL,
    raca varchar2(100)  NOT NULL,
    genero varchar2(1)  NULL,
    data_nascimento number(8)  NOT NULL,
    cod_clientes number(9)  NOT NULL,
    CONSTRAINT Pet_pk PRIMARY KEY (cod_pet)
) ;

-- Table: Produtos
CREATE TABLE Produtos (
    cod_produtos number(9)  NOT NULL,
    codigo_barras varchar2(13)  NULL,
    nome varchar2(100)  NULL,
    marca varchar2(100)  NULL,
    tipo varchar2(100)  NULL,
    fornecedor varchar2(100)  NULL,
    valor_compra float(12)  NULL,
    valor_venda float(12)  NULL,
    quant_estoque number(11)  NULL,
    cod_fornecedores number(9)  NOT NULL,
    CONSTRAINT Produtos_pk PRIMARY KEY (cod_produtos)
) ;

-- Table: Servicos
CREATE TABLE Servicos (
    cod_servicos number(9)  NOT NULL,
    descricao varchar2(160)  NULL,
    valor float(8)  NULL,
    tempo timestamp  NULL,
    CONSTRAINT Servicos_pk PRIMARY KEY (cod_servicos)
) ;

-- Table: cliente_servicos
CREATE TABLE cliente_servicos (
    cod_cliente_serv number(9)  NOT NULL,
    cod_clientes number(9)  NOT NULL,
    cod_servicos number(9)  NOT NULL,
    CONSTRAINT cliente_servicos_pk PRIMARY KEY (cod_cliente_serv)
) ;

-- Table: compras_produtos
CREATE TABLE compras_produtos (
    cod_comp_prod number(9)  NOT NULL,
    cod_produtos number(9)  NOT NULL,
    cod_compras number(9)  NOT NULL,
    CONSTRAINT compras_produtos_pk PRIMARY KEY (cod_comp_prod)
) ;

-- Table: pet_servicos
CREATE TABLE pet_servicos (
    cod_pet_serv number(9)  NOT NULL,
    cod_pet number(9)  NOT NULL,
    cod_servicos number(9)  NOT NULL,
    CONSTRAINT pet_servicos_pk PRIMARY KEY (cod_pet_serv)
) ;

-- Table: servicos_funcionario
CREATE TABLE servicos_funcionario (
    cod_serv_func number(9)  NOT NULL,
    cod_servicos number(9)  NOT NULL,
    cod_funcionario number(9)  NOT NULL,
    CONSTRAINT servicos_funcionario_pk PRIMARY KEY (cod_serv_func)
) ;

-- foreign keys
-- Reference: Compras_Clientes (table: Compras)
ALTER TABLE Compras ADD CONSTRAINT Compras_Clientes
    FOREIGN KEY (cod_clientes)
    REFERENCES Clientes (cod_clientes);

-- Reference: Compras_Funcionario (table: Compras)
ALTER TABLE Compras ADD CONSTRAINT Compras_Funcionario
    FOREIGN KEY (cod_funcionario)
    REFERENCES Funcionario (cod_funcionario);

-- Reference: Funcionario_Cargo_funcionario (table: Funcionario)
ALTER TABLE Funcionario ADD CONSTRAINT Funcionario_Cargo_funcionario
    FOREIGN KEY (cod_cargo)
    REFERENCES Cargo_funcionario (cod_cargo);

-- Reference: Pet_Clientes (table: Pet)
ALTER TABLE Pet ADD CONSTRAINT Pet_Clientes
    FOREIGN KEY (cod_clientes)
    REFERENCES Clientes (cod_clientes);

-- Reference: Produtos_Fornecedores (table: Produtos)
ALTER TABLE Produtos ADD CONSTRAINT Produtos_Fornecedores
    FOREIGN KEY (cod_fornecedores)
    REFERENCES Fornecedores (cod_fornecedores);

-- Reference: cliente_servicos_Clientes (table: cliente_servicos)
ALTER TABLE cliente_servicos ADD CONSTRAINT cliente_servicos_Clientes
    FOREIGN KEY (cod_clientes)
    REFERENCES Clientes (cod_clientes);

-- Reference: cliente_servicos_Servicos (table: cliente_servicos)
ALTER TABLE cliente_servicos ADD CONSTRAINT cliente_servicos_Servicos
    FOREIGN KEY (cod_servicos)
    REFERENCES Servicos (cod_servicos);

-- Reference: compras_produtos_Compras (table: compras_produtos)
ALTER TABLE compras_produtos ADD CONSTRAINT compras_produtos_Compras
    FOREIGN KEY (cod_compras)
    REFERENCES Compras (cod_compras);

-- Reference: compras_produtos_Produtos (table: compras_produtos)
ALTER TABLE compras_produtos ADD CONSTRAINT compras_produtos_Produtos
    FOREIGN KEY (cod_produtos)
    REFERENCES Produtos (cod_produtos);

-- Reference: pet_servicos (table: pet_servicos)
ALTER TABLE pet_servicos ADD CONSTRAINT pet_servicos
    FOREIGN KEY (cod_pet)
    REFERENCES Pet (cod_pet);

-- Reference: pet_servicos_Servicos (table: pet_servicos)
ALTER TABLE pet_servicos ADD CONSTRAINT pet_servicos_Servicos
    FOREIGN KEY (cod_servicos)
    REFERENCES Servicos (cod_servicos);

-- Reference: servicos_funcionario (table: servicos_funcionario)
ALTER TABLE servicos_funcionario ADD CONSTRAINT servicos_funcionario
    FOREIGN KEY (cod_funcionario)
    REFERENCES Funcionario (cod_funcionario);

-- Reference: servicos_funcionario_Servicos (table: servicos_funcionario)
ALTER TABLE servicos_funcionario ADD CONSTRAINT servicos_funcionario_Servicos
    FOREIGN KEY (cod_servicos)
    REFERENCES Servicos (cod_servicos);