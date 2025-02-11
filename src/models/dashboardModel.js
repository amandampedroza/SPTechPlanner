var database = require("../database/config")


function buscarFaltas(aluno) {
    var instrucaoSql = `SELECT SUM(faltas) AS qtdFaltas, nome AS materia FROM falta 
    JOIN materia ON fkMateria = idMateria
     WHERE fkAluno = ${aluno} GROUP BY nome;`
    return database.executar(instrucaoSql);
  }
  
  function kpiFaltas(aluno) {
    var instrucaoSql = `SELECT SUM(faltas) AS faltas FROM falta WHERE fkAluno = ${aluno}`
    return database.executar(instrucaoSql);
  }

    
  function buscarMedias(aluno) {
    var instrucaoSql = `SELECT 
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
WHERE fkAluno = ${aluno}
GROUP BY 
    n.semestre, 
    n.fkMateria, 
    n.fkAluno, 
    m.nome, 
    a.nome;	`
    return database.executar(instrucaoSql);
  }
  


module.exports = {
   buscarFaltas, kpiFaltas, buscarMedias
};