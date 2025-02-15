var database = require("../database/config")


function cadastrarNota(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno, semestre) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega, notaIntegrada, notaProva, sprint, aluno, materia, semestre);

  notaEntrega = notaEntrega !== '' ? notaEntrega : 0;
  notaIntegrada = notaIntegrada !== '' ? notaIntegrada : 0;
  notaProva = notaProva !== '' ? notaProva : 0;  

  var instrucaoSql =
    `
      INSERT INTO nota (notaEntrega, notaIntegrada, notaProva, sprint, semestre, fkAluno, fkMateria) VALUES 
      ('${notaEntrega}', '${notaIntegrada}', '${notaProva}', '${sprint}', '${semestre}', '${aluno}', '${materia}');
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrarNota2(materia, notaEntrega2, notaProva2, sprint, aluno, semestre) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega2, notaProva2, sprint, aluno, materia, semestre);

  notaEntrega2 = notaEntrega2 !== '' ? notaEntrega2 : 0;
  notaProva2 = notaProva2 !== '' ? notaProva2 : 0;  

  var instrucaoSql =
    `
      INSERT INTO nota (notaEntrega, notaProva, sprint, semestre, fkAluno, fkMateria) VALUES 
      ('${notaEntrega2}', '${notaProva2}', '${sprint}', '${semestre}', '${aluno}', '${materia}');
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrarNota3(materia, notaEntrega3, notaProva3, sprint, aluno, semestre) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega3, notaProva3, sprint, aluno, materia, semestre);

  notaEntrega3 = notaEntrega3 !== '' ? notaEntrega3 : 0;
  notaProva3 = notaProva3 !== '' ? notaProva3 : 0;   

  var instrucaoSql =
    `
      INSERT INTO nota (notaEntrega, notaProva, sprint, semestre, fkAluno, fkMateria) VALUES 
      ('${notaEntrega3}', '${notaProva3}', '${sprint}', '${semestre}', '${aluno}', '${materia}');
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function submeter(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno, semestre) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega, notaIntegrada, notaProva, sprint, aluno, materia, semestre);

  var instrucaoSql =
    `
  UPDATE nota 
SET 
    notaEntrega = '${notaEntrega}',
    notaIntegrada = '${notaIntegrada}',
    notaProva = '${notaProva}',
    sprint = '${sprint}',
    semestre = '${semestre}',
    fkMateria = '${materia}'
     WHERE fkAluno = ${aluno} and fkMateria = ${materia}
     and sprint = '${sprint}' and semestre = '${semestre}';
    `
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

    function submeterDois(materia, notaEntrega2, notaProva2, sprint, aluno, semestre) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega2, notaProva2, sprint, aluno, materia, semestre);

        var instrucaoSql =
          `
      UPDATE nota 
      SET 
        notaEntrega = '${notaEntrega2}',
        notaProva = '${notaProva2}',
        sprint = '${sprint}',
        semestre = '${semestre}'
        WHERE fkAluno = ${aluno} and fkMateria = ${materia}
        and sprint = '${sprint}' and semestre = '${semestre}';
        `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }

      function submeterTres(materia, notaEntrega3, notaProva3, sprint, aluno, semestre) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaEntrega3, notaProva3, sprint, aluno, materia, semestre);

        var instrucaoSql =
          `
      UPDATE nota 
      SET 
        notaEntrega = '${notaEntrega3}',
        notaProva = '${notaProva3}',
        sprint = '${sprint}',
        semestre = ${semestre}
        WHERE fkAluno = ${aluno} and fkMateria = ${materia}
        and sprint = '${sprint}' and semestre = '${semestre}';
        `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }

      function cadastrarFaltas(materia, faltas, aluno, semestre) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", faltas, aluno, materia, semestre);

      
        var instrucaoSql =
          `
            INSERT INTO falta (faltas, fkAluno, fkMateria, semestre) VALUES 
            ('${faltas}', '${aluno}', '${materia}', '${semestre}');
          `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }

      function cadastrarNotaProjetos(notaProjetos, aluno, semestre) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", notaProjetos, aluno, semestre);
      
        notaProjetos = notaProjetos !== '' ? notaProjetos : 0;  
      
        var instrucaoSql =
          `
           UPDATE nota  
           set notaProjetos = '${notaProjetos}'
           WHERE fkAluno = '${aluno}' 
           AND semestre = '${semestre}';
          `
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
      }


module.exports = {
  submeter, submeterDois, submeterTres, cadastrarNota, cadastrarNota2, cadastrarNota3, cadastrarFaltas, cadastrarNotaProjetos
};