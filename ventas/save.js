var db = require('./conexion');

exports.save = (req, res) => {
    const codart  = req.body.codart;
    const descrip = req.body.descrip;
    const precio = req.body.precio;
    const stock = req.body.stock;
    const dto = req.body.dto;
    db.query('INSERT INTO articulos (codart, descrip, precio, stock, dto) VALUES ($1, $2, $3, $4, $5)', [codart, descrip, precio, stock, dto], (err, result) => {
        if (err) {
            console.log(err);
            return;
        }
        res.redirect('/tablaProductos');
    });
}