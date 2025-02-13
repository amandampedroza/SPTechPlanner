
-- CRIANDO O BANCO DE DADOS
-- FAZER COM O ROOT
create database SPTechPlanner;

-- CRIANDO USUARIO SPTecher 
-- FAZER COM O ROOT
CREATE USER 'SPTecher'@'%' IDENTIFIED BY 'SPTech@2025';
GRANT ALL PRIVILEGES ON SPTechPlanner.* TO 'SPTecher'@'SPTech@2025';
FLUSH PRIVILEGES;


-- AGORA USANDO O USUARIO SPTecher
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

create table materia (
idMateria int primary key auto_increment not null,
nome varchar(100)
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

create table falta (
idFalta int primary key auto_increment,
faltas int,
fkMateria int,
fkAluno int,
semestre int,
constraint fkMateriaFalta foreign key (fkMateria) references materia(idMateria),
constraint fkAlunoFalta foreign key (fkAluno) references aluno(idAluno)
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
('Algoritmos'), 
('ArqComp'), 
('BDD'), 
('IntSO'), 
('PI'), 
('TI'),
('CCP'), 
('Ling. Programação'),
('Analise de S.'), 
('SO'), 
('SocioEmocional');



select * from nota;

select
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
    
    select * from aluno;
    
    
    select round(avg(n.notaProva),1) , n.semestre, a.nome, n.sprint from nota n join aluno a on fkAluno = idAluno where idAluno = 5 group by n.semestre, n.sprint, a.nome;







