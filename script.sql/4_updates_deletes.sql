-- -----------------------------------------------------
-- Manipulação de Dados (UPDATE e DELETE)
-- -----------------------------------------------------

-- === COMANDOS UPDATE (3 exemplos) ===

-- 1. Atualizar o preço do curso de Python (Promoção)
UPDATE Curso
SET Preco = 19.90
WHERE Titulo = 'Python para Iniciantes';

-- 2. Corrigir o email de um aluno específico
UPDATE Aluno
SET Email = 'lucas.novoemail@gmail.com'
WHERE ID_Aluno = 1;

-- 3. Alterar o status da matrícula de um aluno para 'Concluída'
UPDATE Matricula
SET Status = 'Concluida'
WHERE ID_Aluno = 2 AND ID_Curso = 2;


-- === COMANDOS DELETE (3 exemplos) ===
-- Nota: Respeitando a integridade referencial (deletar filhos antes dos pais se não houver CASCADE)

-- 1. Deletar uma matrícula específica que estava cancelada
DELETE FROM Matricula
WHERE Status = 'Cancelada' AND ID_Aluno = 3;

-- 2. Deletar uma aula específica pelo ID
DELETE FROM Aula
WHERE ID_Aula = 3; -- Ex: Aula de Configuração do VS Code

-- 3. Deletar um instrutor que NÃO tem cursos associados (Seguro)
-- (Vamos supor que inserimos um instrutor temporário para teste antes)
INSERT INTO Instrutor (Nome, Email, Especialidade) VALUES ('Teste', 'teste@teste.com', 'Nada');
DELETE FROM Instrutor
WHERE Nome = 'Teste';