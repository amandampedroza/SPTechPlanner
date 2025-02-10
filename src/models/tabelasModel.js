var database = require("../database/config")


function cadastrarNota(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega, notaIntegrada, notaProva, sprint, aluno, materia);

  // notaEntrega = notaEntrega !== '' ? notaEntrega : 0;
  // notaIntegrada = notaIntegrada !== '' ? notaIntegrada : 0;
  // notaProva = notaProva !== '' ? notaProva : 0;  

  var instrucaoSql =
    `
      INSERT INTO nota (notaEntrega, notaIntegrada, notaProva, sprint, fkAluno, fkMateria) VALUES 
      ('${notaEntrega}', '${notaIntegrada}', '${notaProva}', '${sprint}', '${aluno}', '${materia}');
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function submeter(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega, notaIntegrada, notaProva, sprint, aluno, materia);

  var instrucaoSql =
    `
  UPDATE nota 
SET 
    notaEntrega = '${notaEntrega}',
    notaIntegrada = '${notaIntegrada}',
    notaProva = '${notaProva}',
    sprint = '${sprint}',
    fkMateria = '${materia}'
     WHERE fkAluno = ${aluno} and fkMateria = ${materia}
     and sprint = '${sprint}';
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

    function submeterDois(materia, notaEntrega2, notaProva2, sprint, aluno) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega2, notaProva2, sprint, aluno, materia);

        var instrucaoSql =
          `
      UPDATE nota 
      SET 
        notaEntrega = '${notaEntrega2}',
        notaProva = '${notaProva2}',
        sprint = '${sprint}'
        WHERE fkAluno = ${aluno} and fkMateria = ${materia}
        and sprint = '${sprint}';
        `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }

      function submeterTres(materia, notaEntrega3, notaProva3, sprint, aluno, notaProjetos) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaProjetos, notaEntrega3, notaProva3, sprint, aluno, materia);

        var instrucaoSql =
          `
      UPDATE nota 
      SET 
        notaEntrega = '${notaEntrega3}',
        notaProva = '${notaProva3}',
        notaProjetos = '${notaProjetos}',
        sprint = '${sprint}'
        WHERE fkAluno = ${aluno} and fkMateria = ${materia}
        and sprint = '${sprint}';
        `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }


module.exports = {
  submeter, submeterDois, submeterTres, cadastrarNota
};