var tabelasModel = require("../models/tabelasModel");



function submeter(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var notaEntrega = req.body.notaEntregaServer
    var notaIntegrada = req.body.notaIntegradaServer
    var notaProva = req.body.notaProvaServer
    var notaEntrega2 = req.body.notaEntrega2Server
    var notaProva2 = req.body.notaProva2Server
    var notaEntrega3 = req.body.notaEntrega3Server
    var notaProva3 = req.body.notaProva3Server
    var notaProjetos = req.body.notaProjetosServer
    // var semestre = req.body.semestreServer
    var materia = req.body.materiaServer
    var sprint = req.body.sprintServer
    var aluno = req.body.fkAlunoServer

    if(notaEntrega == undefined){
        notaEntrega = 0
    } if(notaIntegrada == undefined || notaIntegrada == null){
        notaIntegrada = 0
    } if (notaProjetos == undefined || notaProjetos == null || notaProjetos == ""){
        notaProjetos = 0
    } if (notaProva  == undefined) {
        notaProva = 0
    }

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        tabelasModel.submeter(materia, notaEntrega, notaIntegrada, notaProjetos, notaProva, notaEntrega2, notaProva2, notaEntrega3, notaProva3, sprint, aluno)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }


module.exports = {
    submeter
}