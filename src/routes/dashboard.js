var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");


router.get("/buscarFaltas/:aluno", function (req,res){
    dashboardController.buscarFaltas(req,res);
})

router.get("/kpiFaltas/:aluno", function (req,res){
    dashboardController.kpiFaltas(req,res);
})

router.get("/buscarMedias/:aluno", function (req,res){
    dashboardController.buscarMedias(req,res);
})

router.get("/buscarProvasSprint/:aluno", function (req,res){
    dashboardController.buscarProvasSprint(req,res);
})

router.get("/buscarMediasProvas/:aluno", function (req,res){
    dashboardController.buscarMediasProvas(req,res);
})



module.exports = router;