var database = require("../database/config")


// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function submeter(notaEntrega, notaIntegrada, notaProjetos, notaProva, notaEntrega2, notaProva2, notaEntrega3, notaProva3, sprint, aluno, materia) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():",notaEntrega, notaIntegrada, notaProjetos, notaProva, notaEntrega2, notaProva2, notaEntrega3, notaProva3, sprint, aluno, materia);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = 
    `
  UPDATE nota 
SET 
    notaEntrega = '${notaEntrega}',
    notaIntegrada = '${notaIntegrada}',
    notaProjetos = '${notaProjetos}',
    notaProva = '${notaProva}',
    WHERE fkAluno = ${aluno} and fkMateria = ${materia};
    `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
   submeter
};