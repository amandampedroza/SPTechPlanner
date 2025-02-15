
-- CRIANDO O BANCO DE DADOS
-- FAZER COM O ROOT
create database SPTechPlanner;

-- CRIANDO USUARIO SPTecher 
-- FAZER COM O ROOT
CREATE USER 'SPTecher'@'%' IDENTIFIED BY 'SPTech@2025';
GRANT ALL PRIVILEGES ON SPTechPlanner.* TO 'SPTecher'@'SPTech@2025';
FLUSH PRIVILEGES;


-- USANDO O USUARIO SPTecher
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











