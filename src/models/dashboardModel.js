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


module.exports = {
   buscarFaltas, kpiFaltas
};