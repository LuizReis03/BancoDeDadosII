
CREATE DATABASE DB_REIS
USE DB_REIS

-- DECLARANDO VARIÁVEIS EM BANCO DE DADOS
CREATE TABLE [Aluno]
(Matricula Int NOT NULL Identity(1,1) --Contador automático
,NomeAluno Varchar(100) NOT NULL
,CPF CHAR(11) NOT NULL
,DataNcto SMALLDATETIME NOT NULL
,Mensalidade NUMERIC(6,2) NOT NULL
,Turma char(10) NOT NULL
)

--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT ALUNO VALUES ('José da Silva','12345678900','19911121', 1000,'ADS3')
INSERT ALUNO VALUES ('Maria da Silva', '12345678911','20000317',1000, 'ADS1')
INSERT ALUNO VALUES ('Ana da Silva', '12345678922','20000317', 1000,'ADS3')
INSERT ALUNO VALUES ('Mario da Silva', '12386678936','20010312', 1000,'ADS2')


select * from Aluno
/* CRIAÇÃO DE VARIÁVEIS LOCAIS */
DECLARE @TOTAL INT --NÚMERO DE ALUNOS
DECLARE @VALOR NUMERIC(6,2) --VALOR TOTAL MENSALIDADE
DECLARE @VALOR_TURMA NUMERIC(6,2) --VALOR TOTAL MENSALIDADE POR TURMA
DECLARE @TURMA CHAR(5)
DECLARE @msg varchar(100)
/* DEFINE O VALOR DE CADA VARIÁVEL */

SET @TURMA = 'ADS3'
SET @TOTAL = (SELECT COUNT(*) FROM Aluno)
SET @VALOR = (SELECT TOP 1 MENSALIDADE FROM Aluno)
SET @VALOR_TURMA = (SELECT SUM(MENSALIDADE) FROM Aluno WHERE TURMA=@TURMA)

/*
if @TOTAL > 5
	BEGIN
		PRINT('Número de alunos MAIOR que 5')
		PRINT('O total de alunos é: ' + CONVERT(CHAR(10), @TOTAL))
	END
	ELSE
	BEGIN
		PRINT('Número de alunos MENOR que 5')
		PRINT('O total de alunos é: ' + CONVERT(CHAR(10), @TOTAL))
	END
*/

	IF @VALOR > 1000
	BEGIN
		DECLARE @PORCENTAGEM NUMERIC(6,2) 
		DECLARE @DESCONTO NUMERIC (6,2)

		SET @PORCENTAGEM = @VALOR * 0.10
		SET @DESCONTO = @VALOR -@PORCENTAGEM 
		PRINT ('O valor total de mensalidades é ' + CONVERT(CHAR(10), @VALOR))
		PRINT ('Desconto de 10% = ' + CONVERT(CHAR(10), @PORCENTAGEM))
	END

	ELSE
	BEGIN
		SET @PORCENTAGEM = @VALOR * 0.05
		SET @DESCONTO = @VALOR -@PORCENTAGEM 
		PRINT ('O valor total de mensalidades é ' + CONVERT(CHAR(10), @VALOR))
		PRINT ('Desconto de 5% =  ' + CONVERT(CHAR(10), @PORCENTAGEM))
		PRINT ('O valor a ser pago é: ' + CONVERT(CHAR(10), @DESCONTO))
	END
	
	/*EXERCÍCIO 01 - WHILE ATÉ 62*/
/*
DECLARE @CONTADOR INT
SET @CONTADOR = 0
WHILE (@CONTADOR < 100)
	BEGIN
	SET @CONTADOR += 1
	IF @CONTADOR = 62
		BREAK;
END
PRINT('O resultado do While é: '+ CONVERT(CHAR(10), @CONTADOR))
*/

/*EXERCÍCIO 02 - 1 ATÉ 100 NÚMEROS PARES E IMPARES*/
/*
DECLARE @CONTADOR INT
SET @CONTADOR = 0
WHILE (@CONTADOR < 100)
	BEGIN
	SET @CONTADOR += 1
	IF @CONTADOR % 2 = 0
		PRINT('Os números:' +  CONVERT(CHAR(10), @CONTADOR) + 'É par')
	
	ELSE
		PRINT('Os números:' +  CONVERT(CHAR(10), @CONTADOR) + 'É impar')
END
*/

/*EXERCÍCIO 03 - 1 ATÉ 100 NÚMEROS PARES E IMPARES*/
/*
DECLARE @IDADE INT
SET @IDADE = 0
WHILE (@IDADE < 100)
	BEGIN
	SET @IDADE += 1
	IF @IDADE % 2 = 0
		PRINT('Os números:' +  CONVERT(CHAR(10), @IDADE) + 'É par')
	
	ELSE
		PRINT('Os números:' +  CONVERT(CHAR(10), @IDADE) + 'É impar')
END
*/

/*EXERCICIO 04 - Verificar se o aluno Mario está na tabela e calcular aumento na
mensalidade de 10% e apresentar como jovem se idade menor que 60 senão idoso*/

/*EXERCÍCIO 05 - Mostrar se o aluno Mário da Silva está contido em uma variável, bem
como seu salário e calcular aumento de 10% para ele e mmostre o nome em letras maiúsculas*/
/*
update Aluno 
SET Mensalidade = Mensalidade + (Mensalidade * 0.10)
where aluno.NomeAluno = 'Mario da Silva'

DECLARE @MostraNome varchar(50)
SET @MostraNome = (SELECT NomeAluno from Aluno
where NomeAluno = 'Mario da Silva')

DECLARE @MostraMensal numeric(6,2)
SET @MostraMensal = (SELECT Mensalidade from Aluno
where NomeAluno = 'Mario da Silva')

PRINT('Nome maiúsculo = ' + upper(@MostraNome))
PRINT('Mensalidade = ' + CONVERT(CHAR(10), @MostraMensal))
*/

/* EXERCÍCIO 06 - Apresentar o resultado da variável idade será formada pela data atual
ou seja dia + mês + 21 do ano igual a 4 + 3 + 21 e mostrar como resultado: 
Se menor que 10 igual a Criança 
De 10 até 17 igual a jovem
De 18 até 60 igual a Adulto
Acima de 61 Idoso
*/
/*
DECLARE @IDADE int
SET @IDADE  = sum(DATEPART(day, getdate()) + DATEPART(month, getdate()) + 
convert (int, substring(convert (char(4),DATEPART(year, getdate())),3,2)))

if @IDADE < 10
BEGIN
	PRINT('Sua idade é: ' + CONVERT(CHAR(2), @IDADE) + ', portanto você é criança')
END
IF @IDADE > 10 AND @IDADE <= 17
BEGIN
	PRINT('Sua idade é: ' + CONVERT(CHAR(2), @IDADE) + ', portanto você é jovem')
END
IF @IDADE >= 18 AND @IDADE <= 60
BEGIN
	PRINT('Sua idade é: ' + CONVERT(CHAR(2), @IDADE) + ', portanto você é adulto')
END
ELSE
BEGIN 
	PRINT('Sua idade é: ' + CONVERT(CHAR(2), @IDADE) + ', portanto você é idoso')
END
*/

