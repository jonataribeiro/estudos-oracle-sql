-- Sabendo os principais tipos de dados, a criação das nossas tabelas segue a estrutura abaixo:

-- Criando uma tabela de "Alunos"
CREATE TABLE alunos(
    ID_Aluno NUMBER PRIMARY KEY,
    Nome_Aluno VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100)
);

-- Criando uma tabela de "Cursos"

CREATE TABLE cursos(
    ID_Curso INT,
    Nome_Curso VARCHAR(100),
    Preco_Curso DECIMAL(10, 2)
);

-- Criando uma tabela de "Matrículas"

CREATE TABLE matrículas(
    ID_Matrícula INT,
    ID_Aluno INT,
    ID_Curso INT,
    Data_Cadastro DATE
);


SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matrículas;

-- INSERINDO DADOS NAS TABELAS (INSERT INTO)

INSERT INTO alunos(ID_Aluno, Nome_Aluno, Email)
VALUES
    (1, 'Ana Maria Campelo', 'anacampelo@gmail.com'),
    (2, 'Bruna Camargo', 'bruna@gmail.com'),
    (3, 'Camila Garcia', 'camila@gmail.com'),
    (4, 'Damares Silva', 'damares@gmail.com'),
    (5, 'Eduardo Assis', 'eduardoassis@gmail.com'),
    (6, 'Fabiano Silva', 'fabiano@gmail.com'),
    (7, 'Iara Sampaio', 'iarasampaio@gmail.com');
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    