const { Client } = require("pg");

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'venta',
    password: 'se8916401',
    port: '5432'
});

client.connect((err) => {
    if (!err) { console.log("Conexion Establecida"); }
    else {
        console.log("Conexion Fallida")
    }
}
);
module.exports=client;