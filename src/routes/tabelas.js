var express = require("express");
var router = express.Router();

var tabelasController = require("../controllers/tabelasController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.put("/submeter", function (req, res) {
    tabelasController.submeter(req, res);
});



module.exports = router;