## Projeto de Banco de Dados - Randstad Bootcamp

<img width="1304" height="455" alt="image" src="https://github.com/user-attachments/assets/ce3c7c86-0940-4dbf-ae74-2af387df3458" />

Este projeto tem como objetivo modelar e implementar um banco de dados relacional para uma **oficina mecânica**, visando o controle e gerenciamento de **ordens de serviço**, **clientes**, **veículos**, **mecânicos**, **serviços prestados** e **peças utilizadas**.

##  Descrição do Projeto

O sistema permitirá registrar:

- Clientes e seus veículos
- Equipes de mecânicos e suas especialidades
- Ordens de serviço (OS) com data de abertura, entrega, status e autorização
- Serviços executados e peças utilizadas em cada OS
- Cálculo de valores de mão de obra e peças por OS

##  Modelagem Conceitual (Resumo)

- Um **cliente** pode possuir vários **veículos**.
- Cada **veículo** pode ter várias **ordens de serviço**.
- Uma **OS** é atribuída a uma **equipe** de mecânicos.
- Cada **equipe** é composta por vários **mecânicos**, cada um com uma especialidade.
- Uma **OS** pode conter vários **serviços** e utilizar diversas **peças**.
- O valor total da OS é composto pela soma da mão de obra e peças aplicadas.

##  Modelo Lógico Relacional

O banco de dados é composto pelas seguintes tabelas:

### Tabela: Cliente

| Campo     | Tipo        | Restrições        |
|-----------|-------------|-------------------|
| cpf       | CHAR(11)    | PRIMARY KEY       |
| nome      | VARCHAR(100)| NOT NULL          |
| telefone  | VARCHAR(15) |                   |
| endereco  | VARCHAR(150)|                   |

---

### Tabela: Veiculo

| Campo        | Tipo        | Restrições             |
|--------------|-------------|------------------------|
| placa        | CHAR(7)     | PRIMARY KEY            |
| modelo       | VARCHAR(50) |                        |
| marca        | VARCHAR(50) |                        |
| ano          | INT         |                        |
| cor          | VARCHAR(30) |                        |
| cpf_cliente  | CHAR(11)    | FOREIGN KEY → Cliente  |

---

### Tabela: Equipe

| Campo         | Tipo        | Restrições    |
|---------------|-------------|---------------|
| id_equipe     | INT         | PRIMARY KEY   |
| nome          | VARCHAR(50) |               |
| data_criacao  | DATE        |               |

---

### Tabela: Mecanico

| Campo        | Tipo         | Restrições            |
|--------------|--------------|-----------------------|
| id_mecanico  | INT          | PRIMARY KEY           |
| nome         | VARCHAR(100) |                       |
| endereco     | VARCHAR(150) |                       |
| especialidade| VARCHAR(100) |                       |
| id_equipe    | INT          | FOREIGN KEY → Equipe  |

---

### Tabela: Ordem_Servico

| Campo                | Tipo         | Restrições             |
|----------------------|--------------|------------------------|
| id_os                | INT          | PRIMARY KEY            |
| data_abertura        | DATE         |                        |
| data_entrega_prevista| DATE         |                        |
| status               | VARCHAR(20)  |                        |
| autorizacao          | BOOLEAN      |                        |
| placa_veiculo        | CHAR(7)      | FOREIGN KEY → Veiculo  |
| id_equipe            | INT          | FOREIGN KEY → Equipe   |

---

### Tabela: Servico

| Campo          | Tipo         | Restrições    |
|----------------|--------------|---------------|
| id_servico     | INT          | PRIMARY KEY   |
| descricao      | VARCHAR(200) |               |
| valor_mao_obra | DECIMAL(10,2)|               |

---

### Tabela: Peca

| Campo     | Tipo         | Restrições    |
|-----------|--------------|---------------|
| id_peca   | INT          | PRIMARY KEY   |
| nome      | VARCHAR(100) |               |
| valor     | DECIMAL(10,2)|               |

---

### Tabela: OS_Servico (relacionamento N:N)

| Campo       | Tipo         | Restrições                         |
|-------------|--------------|------------------------------------|
| id_os       | INT          | FOREIGN KEY → Ordem_Servico        |
| id_servico  | INT          | FOREIGN KEY → Servico              |
| quantidade  | INT          | DEFAULT 1                          |
| valor_total | DECIMAL(10,2)| Calculado ou armazenado            |
| PRIMARY KEY | (id_os, id_servico) |                            |

---

### Tabela: OS_Peca (relacionamento N:N)

| Campo       | Tipo         | Restrições                         |
|-------------|--------------|------------------------------------|
| id_os       | INT          | FOREIGN KEY → Ordem_Servico        |
| id_peca     | INT          | FOREIGN KEY → Peca                 |
| quantidade  | INT          | DEFAULT 1                          |
| valor_total | DECIMAL(10,2)| Calculado ou armazenado            |
| PRIMARY KEY | (id_os, id_peca)   |                              |

##  Estrutura do Banco de Dados (SQL)

O script SQL `modelo_logico_oficina.sql` contém toda a estrutura de criação das tabelas com:

- Chaves primárias (PK)
- Chaves estrangeiras (FK)
- Tipos de dados apropriados
- Tabelas associativas para relacionamentos N:N
