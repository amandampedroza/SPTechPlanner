var dashboardModel = require("../models/dashboardModel");


function buscarFaltas(req, res){
    var aluno = req.params.aluno;
    dashboardModel.buscarFaltas(aluno).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados para o gráfico! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

module.exports = {
   buscarFaltas
}