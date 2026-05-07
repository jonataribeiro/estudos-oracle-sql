-- COMMIT: Imagine que você está fazendo várias mudanças no banco de dados, como inserções
-- atualizações ou exclusões de dados. O COMMIT é como apertat "SALVAR". Ele confirma todas
-- as alterações feitas, garantindo que elas se tornem permanentes no banco de dados.

-- ROLLBACK: é como um "VOLTAR ATRÁS". Ele é usado para desfazer todas as mudanças,
-- restaurando o estado do banco de dados para antes das alterações feitas. Isso é útil
-- em situações onde você precisa cancelar uma ação ou corrigir um erro.

-- O COMMIT e o ROLLBACK salvam ou desfazem ações de INSERT, UPDATE E DELETE.

-- INSERT: inserir dados na tabela.
-- UPDATE: atualizar dados na tabela.
-- DELETE: excluir dados na tabela.

-- Exemplo 1: Inserir um registro na tabela ALUNO. SALVAR COM O COMMIT.

SELECT * FROM aluno;

INSERT INTO aluno (id_aluno, nome_aluno, sexo_aluno, data_nasc_aluno)
VALUES (2, 'Code', 'F', '11/01/1991');

COMMIT;




-- Exemplo 2: Excluir um registro na tabela ALUNOS. Desfazer essa exclusão com o ROLLBACK.

SELECT * FROM aluno;

DELETE FROM aluno
WHERE id_aluno = 1;

rollback;


-- Temos alguns comandos em que o commit é executado automaticamente. Ou seja, no
-- momento que executo o comando, o commit também é executado em seguida.
-- Consequentemente, não conseguimos desfazer tais comandos.

-- Que comandos são esses?

-- CREATE, ALTER, DROP

-- Usamos o create para cirar a tabela de aluno. Create table aluno.




















