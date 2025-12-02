-- -----------------------------------------------------
-- Consultas (SELECT) - Relatórios Gerenciais
-- -----------------------------------------------------

-- 1. Listagem simples de cursos com preço acima de R$ 30,00
-- Utiliza: WHERE, ORDER BY
SELECT Titulo, Preco, Descricao
FROM Curso
WHERE Preco > 30.00
ORDER BY Preco DESC;

-- 2. Relatório de Alunos e suas Matrículas (Quem comprou o quê?)
-- Utiliza: INNER JOIN para juntar Aluno, Matricula e Curso
SELECT 
    a.Nome AS Nome_Aluno,
    c.Titulo AS Curso_Matriculado,
    m.Data_Matricula,
    m.Status
FROM Aluno a
JOIN Matricula m ON a.ID_Aluno = m.ID_Aluno
JOIN Curso c ON c.ID_Curso = m.ID_Curso;

-- 3. Total de cursos cadastrados por Instrutor
-- Utiliza: LEFT JOIN, GROUP BY, COUNT
SELECT 
    i.Nome AS Instrutor,
    COUNT(c.ID_Curso) AS Total_Cursos
FROM Instrutor i
LEFT JOIN Curso c ON i.ID_Instrutor = c.ID_Instrutor
GROUP BY i.Nome;

-- 4. Detalhes das Aulas do Curso de "Python para Iniciantes"
-- Utiliza: Múltiplos JOINS para navegar de Curso -> Modulo -> Aula
SELECT 
    c.Titulo AS Curso,
    mod.Titulo AS Modulo,
    a.Titulo AS Aula,
    a.Duracao_Minutos
FROM Curso c
JOIN Modulo mod ON c.ID_Curso = mod.ID_Curso
JOIN Aula a ON mod.ID_Modulo = a.ID_Modulo
WHERE c.Titulo = 'Python para Iniciantes'
ORDER BY mod.Ordem, a.Titulo;