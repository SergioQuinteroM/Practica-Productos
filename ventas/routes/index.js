var express = require('express');
var router = express.Router();
var db = require('../conexion');
const save = require('../save');
const update = require('../update');


router.post('/save', save.save);
router.post('/update', update.update);

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/listaProductos', function(req, res, next) {
7
    db.query("Select * from articulos",function(err,result){
      res.render('productList',{Product:result.rows});
    })
});

router.get('/tablaProductos', function(req, res, next) {
  7
      db.query("Select * from articulos",function(err,result){
        res.render('productTable',{Product:result.rows});
      })
  });

  router.get('/update/:codart', (req, res) => {
    const codart = req.params.codart;
    db.query('SELECT * FROM articulos WHERE codart = $1', [codart], (err, result) => {
        if (err) {
            console.log(err);
            return;
        }
        res.render('update', { user: result.rows[0] });
    });
});


  router.get('/delete/:codart', (req, res) => {
    const codart = req.params.codart;
    db.query('DELETE FROM articulos WHERE codart = $1', [codart], (err, result) => {
        if (err) {
            console.log(err);
            return;
        }
        res.redirect('/tablaProductos');
    });
});


module.exports = router;
