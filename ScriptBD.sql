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



create table nota (
idNota int primary key auto_increment,
notaEntrega float,
notaIntegrada float,
notaProva float,
notaProjetos float,
sprint char(3),
semestre int,
fkAluno int,
fkMateria int,
constraint fkNotaMateria foreign key (fkMateria) references materia(idMateria),
constraint fkNotaAluno foreign key (fkAluno) references aluno(idAluno)
);

drop table nota;

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

insert into materia (nome) values
('SocioEmocional');






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

INSERT INTO aluno_semestre (fkAluno, fkSemestre)
VALUES (1, 2);

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

-- João na matéria 'CCP' no 2º semestre (Sprint 1)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (8.5, 'Prova', 1, 1);  -- 1 = Sprint 1

-- João na matéria 'CCP' no 2º semestre (Sprint 2)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (7.0, 'Trabalho', 2, 1);  -- 2 = Sprint 2

-- João na matéria 'CCP' no 2º semestre (Sprint 3)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (9.2, 'Exercício', 3, 1);  -- 3 = Sprint 3

-- João na matéria 'LP' no 2º semestre (Sprint 1)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (8.0, 'Prova', 4, 1);  -- 4 = Sprint 1

-- João na matéria 'LP' no 2º semestre (Sprint 2)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (6.5, 'Trabalho', 5, 1);  -- 5 = Sprint 2

-- João na matéria 'LP' no 2º semestre (Sprint 3)
INSERT INTO nota (valor, tipoNota, fkSprint, fkAluno)
VALUES (7.8, 'Exercício', 6, 1);  -- 6 = Sprint 3




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
JOIN aluno_semestre asem ON a.idAluno = asem.fkAluno AND s.idSemestre = asem.fkSemestre;

SELECT idMateria, nome, fkSemestre
FROM materia
WHERE nome = 'CCP';

SELECT n.idNota, n.valor, n.tipoNota, sp.numeroSprint
FROM nota n
JOIN sprint sp ON n.fkSprint = sp.idSprint
JOIN materia m ON sp.fkMateria = m.idMateria
WHERE m.nome = 'ArqComp' 
AND n.fkAluno = 2;

INSERT INTO nota (notaEntrega, notaIntegrada, notaProva, notaProjetos, sprint, fkAluno) VALUES ('0', '7.3', '0', '0', 'SP1', '1' );

UPDATE nota set notaEntrega = 1, notaProva = 2;


select * from nota;

insert into nota (fkAluno) values
(1);

drop table nota;

SELECT 
    n.fkAluno,
    a.nome AS nomeAluno,
    n.fkMateria,
    m.nome AS nomeMateria,
    n.sprint,
    
    -- Notas ajustadas de cada sprint
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaProva * 0.4 ELSE NULL END, 1) AS notaProvaAjustada_SP1,
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaIntegrada * 0.3 ELSE NULL END, 1) AS notaIntegradaAjustada_SP1,
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP1,

    ROUND(CASE WHEN n.sprint = 'SP2' THEN n.notaProva * 0.7 ELSE NULL END, 1) AS notaProvaAjustada_SP2,
    ROUND(CASE WHEN n.sprint = 'SP2' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP2,

    ROUND(CASE WHEN n.sprint = 'SP3' THEN n.notaProva * 0.7 ELSE NULL END, 1) AS notaProvaAjustada_SP3,
    ROUND(CASE WHEN n.sprint = 'SP3' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP3,

    -- Nota de projetos ajustada
    ROUND(n.notaProjetos * 0.6, 1) AS notaProjetosAjustada,

    -- Soma das notas ajustadas das sprints
    ROUND(
        COALESCE(n.notaProva * 0.4, 0) + COALESCE(n.notaIntegrada * 0.3, 0) + COALESCE(n.notaEntrega * 0.3, 0) + 
        COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0) + 
        COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0), 
        1
    ) AS somaNotasSprints,

    -- Nota final: (soma das sprints * 0.6) + notaProjetosAjustada
    ROUND(
        (COALESCE(n.notaProva * 0.4, 0) + COALESCE(n.notaIntegrada * 0.3, 0) + COALESCE(n.notaEntrega * 0.3, 0) + 
         COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0) + 
         COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6
        + COALESCE(n.notaProjetos * 0.6, 0), 
        1
    ) AS notaFinal

FROM nota n
LEFT JOIN aluno a ON n.fkAluno = a.idAluno
LEFT JOIN materia m ON n.fkMateria = m.idMateria;


select * from nota;


SELECT 
    n.fkAluno,
    a.nome AS nomeAluno,
    n.fkMateria,
    m.nome AS nomeMateria,
    n.sprint,
    
    -- Notas ajustadas de cada sprint
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaProva * 0.4 ELSE NULL END, 1) AS notaProvaAjustada_SP1,
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaIntegrada * 0.3 ELSE NULL END, 1) AS notaIntegradaAjustada_SP1,
    ROUND(CASE WHEN n.sprint = 'SP1' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP1,

    ROUND(CASE WHEN n.sprint = 'SP2' THEN n.notaProva * 0.7 ELSE NULL END, 1) AS notaProvaAjustada_SP2,
    ROUND(CASE WHEN n.sprint = 'SP2' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP2,

    ROUND(CASE WHEN n.sprint = 'SP3' THEN n.notaProva * 0.7 ELSE NULL END, 1) AS notaProvaAjustada_SP3,
    ROUND(CASE WHEN n.sprint = 'SP3' THEN n.notaEntrega * 0.3 ELSE NULL END, 1) AS notaEntregaAjustada_SP3,

    -- Nota de projetos ajustada
    ROUND(n.notaProjetos * 0.6, 1) AS notaProjetosAjustada,

    -- Nota ajustada para cada sprint
    ROUND(
        (COALESCE(n.notaProva * 0.4, 0) + COALESCE(n.notaIntegrada * 0.3, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
        + COALESCE(n.notaProjetos * 0.6, 0), 
        1
    ) AS notaFinal_SP1,

    ROUND(
        (COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
        + COALESCE(n.notaProjetos * 0.6, 0), 
        1
    ) AS notaFinal_SP2,

    ROUND(
        (COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
        + COALESCE(n.notaProjetos * 0.6, 0), 
        1
    ) AS notaFinal_SP3,

    -- Média das notas finais das sprints
    ROUND(
        (COALESCE(
            (COALESCE(n.notaProva * 0.4, 0) + COALESCE(n.notaIntegrada * 0.3, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
            + COALESCE(n.notaProjetos * 0.6, 0), 0)
        + COALESCE(
            (COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
            + COALESCE(n.notaProjetos * 0.6, 0), 0)
        + COALESCE(
            (COALESCE(n.notaProva * 0.7, 0) + COALESCE(n.notaEntrega * 0.3, 0)) * 0.6 
            + COALESCE(n.notaProjetos * 0.6, 0), 0)
        ) / 3, 1
    ) AS notaFinal

FROM nota n
LEFT JOIN aluno a ON n.fkAluno = a.idAluno
LEFT JOIN materia m ON n.fkMateria = m.idMateria;



SELECT 
    n.fkAluno,
    a.nome AS nomeAluno,
    n.fkMateria,
    m.nome AS nomeMateria,
    
    -- Nota ajustada de cada sprint
    ROUND(SUM(CASE WHEN n.sprint = 'SP1' THEN (n.notaProva * 0.4 + n.notaIntegrada * 0.3 + n.notaEntrega * 0.3) * 0.4 END), 1) AS notaFinal_SP1,
    
    ROUND(SUM(CASE WHEN n.sprint = 'SP2' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3) * 0.4 END), 1) AS notaFinal_SP2,
    
    ROUND(SUM(CASE WHEN n.sprint = 'SP3' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3) * 0.4 END), 1) AS notaFinal_SP3,
    


    -- Média das notas finais das sprints
    ROUND(AVG(
        (CASE WHEN n.sprint = 'SP1' THEN (n.notaProva * 0.4 + n.notaIntegrada * 0.3 + n.notaEntrega * 0.3) * 0.4 + COALESCE(n.notaProjetos * 0.6, 0) END) +
        (CASE WHEN n.sprint = 'SP2' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3) * 0.4 + COALESCE(n.notaProjetos * 0.6, 0) END) +
        (CASE WHEN n.sprint = 'SP3' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3) * 0.4 + COALESCE(n.notaProjetos * 0.6, 0) END)
    ), 1) AS notaFinal

FROM nota n
LEFT JOIN aluno a ON n.fkAluno = a.idAluno
LEFT JOIN materia m ON n.fkMateria = m.idMateria
GROUP BY n.fkAluno, a.nome, n.fkMateria, m.nome;

select * from nota;

SELECT 
    n.semestre,
    m.nome AS materia,
    a.nome AS aluno,
    
   
   ROUND( ROUND(SUM(
        CASE 
            WHEN n.sprint = 'SP1' THEN (n.notaProva * 0.4 + n.notaIntegrada * 0.3 + n.notaEntrega * 0.3)
            WHEN n.sprint = 'SP2' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3)
            WHEN n.sprint = 'SP3' THEN (n.notaProva * 0.7 + n.notaEntrega * 0.3)
            ELSE 0
        END
    ) * 0.4 + SUM(n.notaProjetos * 0.6), 1) / 3 ,1)  AS notaFinal
FROM 
    nota n
JOIN 
    materia m ON n.fkMateria = m.idMateria
JOIN 
    aluno a ON n.fkAluno = a.idAluno
WHERE fkAluno = 1
GROUP BY 
    n.semestre, 
    n.fkMateria, 
    n.fkAluno, 
    m.nome, 
    a.nome;	

select * from nota;
delete from nota where idNota = 6;








