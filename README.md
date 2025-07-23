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

- `Cliente`
- `Veiculo`
- `Equipe`
- `Mecanico`
- `Ordem_Servico`
- `Servico`
- `Peca`
- `OS_Servico` (tabela associativa)
- `OS_Peca` (tabela associativa)

##  Estrutura do Banco de Dados (SQL)

O script SQL `modelo_logico_oficina.sql` contém toda a estrutura de criação das tabelas com:

- Chaves primárias (PK)
- Chaves estrangeiras (FK)
- Tipos de dados apropriados
- Tabelas associativas para relacionamentos N:N
