var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");


router.get("/buscarFaltas/:aluno", function (req,res){
    dashboardController.buscarFaltas(req,res);
})

module.exports = router;