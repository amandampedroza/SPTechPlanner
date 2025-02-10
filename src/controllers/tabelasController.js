var tabelasModel = require("../models/tabelasModel");

function cadastrarNota(req, res) {
    var notaEntrega = req.body.notaEntregaServer
    var notaIntegrada = req.body.notaIntegradaServer
    var notaProva = req.body.notaProvaServer
    var materia = req.body.materiaServer
    var sprint = req.body.sprintServer
    var aluno = req.body.fkAlunoServer


        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        tabelasModel.cadastrarNota(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno)
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


function submeter(req, res) {
    var notaEntrega = req.body.notaEntregaServer
    var notaIntegrada = req.body.notaIntegradaServer
    var notaProva = req.body.notaProvaServer
    var materia = req.body.materiaServer
    var sprint = req.body.sprintServer
    var aluno = req.body.fkAlunoServer


        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        tabelasModel.submeter(materia, notaEntrega, notaIntegrada, notaProva, sprint, aluno)
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

    function submeterDois(req, res) {
        var notaEntrega2 = req.body.notaEntrega2Server
        var notaProva2 = req.body.notaProva2Server
        var materia = req.body.materiaServer
        var sprint = req.body.sprintServer
        var aluno = req.body.fkAlunoServer
    
            tabelasModel.submeterDois(materia, notaEntrega2, notaProva2, sprint, aluno)
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

        function submeterTres(req, res) {
            var notaEntrega3 = req.body.notaEntrega3Server
            var notaProva3 = req.body.notaProva3Server
            var materia = req.body.materiaServer
            var sprint = req.body.sprintServer
            var aluno = req.body.fkAlunoServer
            var notaProjetos = req.body.notaProjetosServer
        
                tabelasModel.submeterTres(materia, notaEntrega3, notaProva3, sprint, aluno, notaProjetos)
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
    submeter, submeterDois, submeterTres, cadastrarNota
}