var db = require('./conexion');

exports.update = (req, res) => {
    const codart = req.body.codart;
    const descrip = req.body.descrip;
    const stock = req.body.stock;
    const dto = req.body.dto;
    const precio = req.body.precio;
    db.query('UPDATE articulos SET descrip = $2, stock = $3, dto = $4, precio = $5 WHERE codart = $1', [codart, descrip, stock, dto, precio], (err, result) => {
        if (err) {
            console.log(err);
            return;
        }
        res.redirect('/tablaproductos');
    });
}