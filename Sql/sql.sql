PUNTO 1, CONSULTAS EN POSTGRES

1. SELECT descrip as nombre, stock as Stock_Maximo, stock_min as Stock_Minimo, precio FROM articulos
    WHERE precio BETWEEN 5 AND 25;

2. SELECT codcli, iva, count(*) as cantidad_facturas
	FROM public.facturas where codcli between 340 and 350 group by codcli, iva;

3.    select * from facturas where fecha between '01-12-2012' and '31-12-2012'

4.    SELECT clientes.codcli as codigo_cliente, clientes.nombre as nombre_cliente, pueblos.nombre as nombre_pueblo, count(facturas.codfac) as cantidad_facturas FROM clientes INNER JOIN pueblos ON clientes.codpue = pueblos.codpue left join facturas on clientes.codcli = facturas.codcli group by clientes.codcli, pueblos.nombre order by clientes.nombre;


    