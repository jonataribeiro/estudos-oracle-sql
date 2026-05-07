
--Quais são os funcionários que recebem acima da média de todos os funcionários?

SELECT * FROM employees;
-- 1º Passo: Descobrir a média salarial

SELECT AVG(salary) FROM employees; -- 6593,59

-- 2º Passo: Filtrar a tabela EMPLOYEES baseado no valor acima

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);          -- (6593.59)  -- Obs.: Jamais esccreva valor fixo a menos que tenha certeza que seja constante

-- Um detalhe importante sobre a subquery acima é que ela é executada de dentro pra fora.
-- Primeiro é executado a query mais interna, para só depoois executar a query mais externa.
-- Dessa forma, não existe nenhuma dependência da query interna em relação à query externa.
-- Ela é calculada de forma independente.
-- Em alguns casos, no entanto, a query mais interna depende da query externa.
