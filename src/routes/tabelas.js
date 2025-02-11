var express = require("express");
var router = express.Router();

var tabelasController = require("../controllers/tabelasController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.put("/submeter", function (req, res) {
    tabelasController.submeter(req, res);
});

router.put("/submeterDois", function (req, res) {
    tabelasController.submeterDois(req, res);
});

router.put("/submeterTres", function (req, res) {
    tabelasController.submeterTres(req, res);
});

router.post("/cadastrarNota", function (req, res) {
    tabelasController.cadastrarNota(req, res);
});

router.post("/cadastrarNota2", function (req, res) {
    tabelasController.cadastrarNota2(req, res);
});

router.post("/cadastrarNota3", function (req, res) {
    tabelasController.cadastrarNota3(req, res);
});


router.post("/cadastrarFaltas", function (req, res) {
    tabelasController.cadastrarFaltas(req, res);
});


router.post("/cadastrarNotaProjetos", function (req, res) {
    tabelasController.cadastrarNotaProjetos(req, res);
});





module.exports = router;