create database SPTechPlanner;
use SPTechPlanner;


create table curso (
idCurso int primary key not null,
nome varchar (100)
);


create table aluno (
idAluno int primary key auto_increment,
nome varchar (100),
email varchar(256),
senha varchar(40),
fkCurso int,
constraint fkCursoAluno foreign key (fkCurso) references curso (idCurso)
);

create table semestre (
idSemestre int primary key auto_increment not null,
numeroSemestre int
);

CREATE TABLE aluno_semestre (
idAlunoSemestre INT PRIMARY KEY AUTO_INCREMENT,
fkAluno INT NOT NULL,
fkSemestre INT NOT NULL,
FOREIGN KEY (fkAluno) REFERENCES aluno(idAluno),
FOREIGN KEY (fkSemestre) REFERENCES semestre(idSemestre)
);

create table materia (
idMateria int primary key auto_increment not null,
nome varchar(100),
fkSemestre int,
constraint fkMateriaSemestre foreign key (fkSemestre) references semestre(idSemestre)
);

select * from sprint;
create table sprint (
idSprint int primary key auto_increment not null,
numeroSprint int,
fkMateria int,
constraint fkSprintMateria foreign key (fkMateria) references materia(idMateria)
);

create table nota (
idNota int primary key auto_increment,
valor float,
tipoNota varchar(100),
fkSprint int,
fkAluno int,
constraint fkNotaSprint foreign key (fkSprint) references sprint(idSprint),
constraint fkNotaAluno foreign key (fkAluno) references aluno(idAluno)
);

-- INSERTS

INSERT INTO curso VALUES
(1, 'ADS'),
(2, 'CCO'),
(3, 'SIS');

INSERT INTO semestre (numeroSemestre) VALUES 
(1), 
(2), 
(3), 
(4), 
(5), 
(6), 
(7), 
(8);

INSERT INTO materia (nome, fkSemestre) VALUES 
('Algoritmos', 1), 
('ArqComp', 1), 
('BDD', 1), 
('IntSO', 1), 
('PI', 1), 
('TI', 1);

INSERT INTO materia (nome, fkSemestre) VALUES 
('CCP', 2), 
('LP', 2), 
('AS', 2), 
('SO', 2), 
('PI', 2);

INSERT INTO sprint (numeroSprint, fkMateria) VALUES
(1, 1), (2, 1), (3, 1), -- Sprints para Algoritmos
(1, 2), (2, 2), (3, 2), -- Sprints para ArqComp
(1, 3), (2, 3), (3, 3), -- Sprints para BDD
(1, 4), (2, 4), (3, 4), -- Sprints para IntSO
(1, 5), (2, 5), (3, 5), -- Sprints para PI
(1, 6), (2, 6), (3, 6), -- Sprints para TI
(1, 7), (2, 7), (3, 7), -- Sprints para CCP
(1, 8), (2, 8), (3, 8), -- Sprints para LP
(1, 9), (2, 9), (3, 9), -- Sprints para AS
(1, 10), (2, 10), (3, 10), -- Sprints para SO
(1, 11), (2, 11), (3, 11); -- Sprints para PI





-- TESTE 

-- Inserindo alunos
INSERT INTO aluno (nome, email, senha, fkCurso) VALUES
('João Silva', 'joao@example.com', 'senha123', 1),
('Maria Oliveira', 'maria@example.com', 'senha456', 2),
('Pedro Souza', 'pedro@example.com', 'senha789', 3);


-- Associando alunos aos semestres
INSERT INTO aluno_semestre (fkAluno, fkSemestre) VALUES
(1, 1), -- João no 1º semestre
(2, 2), -- Maria no 2º semestre
(3, 3); -- Pedro no 3º semestre

-- Inserindo notas para o João (idAluno = 1)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno) VALUES
(8.5, 'Prova', 1, 1), -- Nota da prova para a 1ª sprint de Algoritmos
(9.0, 'Trabalho', 2, 1), -- Nota do trabalho para a 2ª sprint de Algoritmos
(7.5, 'Prova', 3, 1); -- Nota da prova para a 3ª sprint de Algoritmos

-- Inserindo notas para a Maria (idAluno = 2)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno) VALUES
(6.5, 'Prova', 4, 2), -- Nota da prova para a 1ª sprint de CCP
(7.0, 'Trabalho', 5, 2), -- Nota do trabalho para a 2ª sprint de CCP
(8.0, 'Prova', 6, 2); -- Nota da prova para a 3ª sprint de CCP

-- Inserindo notas para o Pedro (idAluno = 3)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno) VALUES
(9.5, 'Prova', 7, 3), -- Nota da prova para a 1ª sprint de CCP
(8.0, 'Trabalho', 8, 3), -- Nota do trabalho para a 2ª sprint de CCP
(9.0, 'Prova', 9, 3); -- Nota da prova para a 3ª sprint de CCP


-- SELECT PARA NOTAS DE UMA MATERIA E SEMESTRE
SELECT 
    a.idAluno, 
    a.nome AS nomeAluno, 
    s.idSemestre, 
    s.numeroSemestre, 
    m.idMateria, 
    m.nome AS nomeMateria, 
    sp.idSprint, 
    sp.numeroSprint, 
    n.valor AS nota, 
    n.tipoNota
FROM nota n 
JOIN aluno a ON n.fkAluno = a.idAluno
JOIN sprint sp ON n.fkSprint = sp.idSprint
JOIN materia m ON sp.fkMateria = m.idMateria
JOIN semestre s ON m.fkSemestre = s.idSemestre
JOIN aluno_semestre sm on sm.fkAluno = a.idAluno and
sm.fkSemestre = s.idSemestre
WHERE s.numeroSemestre = 1  -- Substituir pelo semestre desejado
AND m.nome = 'Algoritmos';
-- Substituir pela matéria desejada -- Ordenando por sprint e aluno

-- Media de notas gerais
select avg(valor) from nota where tipoNota = 'Prova' and fkAluno = 2 order by valor;

-- Media de notas por materia
select avg(valor) from nota n
join sprint s on n.fkSprint = s.idSprint
join materia m on s.fkMateria = m.idMateria
 where tipoNota = 'Prova' and fkAluno = 2 
 and m.nome = 'ArqComp' order by valor;
 
 


SELECT 
    a.idAluno, 
    a.nome AS nomeAluno, 
    s.idSemestre, 
    s.numeroSemestre, 
    m.idMateria, 
    m.nome AS nomeMateria, 
    sp.idSprint, 
    sp.numeroSprint, 
    n.valor AS nota, 
    n.tipoNota
FROM nota n
JOIN aluno a ON n.fkAluno = a.idAluno
JOIN sprint sp ON n.fkSprint = sp.idSprint
JOIN materia m ON sp.fkMateria = m.idMateria
JOIN semestre s ON m.fkSemestre = s.idSemestre
JOIN aluno_semestre asem ON a.idAluno = asem.fkAluno AND s.idSemestre = asem.fkSemestre
WHERE s.numeroSemestre = 1
and m.nome = 'Algoritmos' 
and s.numeroSemestre = 1;  -- Substituir pelo semestre desejado


SELECT idMateria, nome, fkSemestre
FROM materia
WHERE nome = 'CCP';

SELECT n.idNota, n.valor, n.tipoNota, sp.numeroSprint
FROM nota n
JOIN sprint sp ON n.fkSprint = sp.idSprint
JOIN materia m ON sp.fkMateria = m.idMateria
WHERE m.nome = 'ArqComp' 
AND n.fkAluno = 2;



select * from aluno_semestre;
