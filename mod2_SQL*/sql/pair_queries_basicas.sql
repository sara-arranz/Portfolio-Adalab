SELECT* 
FROM Employees;

-- Consulta Empleadas. Id, first and last name
SELECT EmployeeID AS id, LastName AS apellido, FirstName AS nombre
FROM Employees;

-- Productos más baratos, identificar productos precio unidad entre 0 y 5 dólares

SELECT *
	FROM Products
    WHERE UnitPrice BETWEEN 0 AND 5;

-- Seleccionamos los datos Null de la tabla Products

SELECT * FROM Products 
    WHERE UnitPrice = NULL;
    
    SELECT UnitPrice
    FROM Products;
    
-- Seleccionamos productos cuyo precio sea menor a 15 dolares y tengan un ID menor que 20

SELECT *
	FROM products
    WHERE UnitPrice < 15 AND ProductID < 20;
    
SELECT UnitPrice, ProductID
	FROM Products;
    
-- Hacemos la misma consulta que la anterior, pero inviertiendo uso de operadores y queremos saber aquellos que tengan un precio superior a 15 dolares y un ID superior a 20

SELECT *
	FROM products
    WHERE UnitPrice > 15 AND ProductID > 20;

-- Otra forma de hacerlo, con NOT

SELECT * 
FROM products 
WHERE NOT (price <= 15 OR product_id <= 20);

-- Lista de paises que hacen pedidos (orders)

SELECT DISTINCT ShipCountry
FROM orders;

-- Consulta que muestra los 10 primeros productos segun su ID y que nos indique el nombre de dichos productos y sus precios

SELECT ProductID,ProductName, UnitPrice
FROM products
ORDER BY ProductID
LIMIT 10;

-- Realizamos la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.

SELECT ProductID,ProductName, UnitPrice
FROM products
ORDER BY ProductID DESC
LIMIT 10;

-- Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).

SELECT DISTINCT OrderID
FROM orderdetails;

-- BONUS
-- Ejercicio 13: Qué pedidos han gastado más:
/* Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer los 3 pedidos 
que han supuesto un mayor ingreso para la empresa. Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price 
.y quantity para calcular el importe total.*/

SELECT order_id, (unit_price*quantity) AS DineroTotal  
FROM order_details   
ORDER BY DineroTotal DESC
LIMIT 3;

-- Ejercicio 14: Los pedidos que están entre las posiciones 5 y 10 de nuestro *ranking*: 
/*Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados entre la 5 y 
la 10 mejor posición en cuanto al coste económico total ImporteTotal.*/

SELECT order_id, (unit_price*quantity) AS DineroTotal  
FROM order_details
ORDER BY DineroTotal DESC
LIMIT 6  
OFFSET 4;

-- Ejercicio 15: Qué categorías tenemos en nuestra BBDD:
/*De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías que componen los tipos de pedido 
de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".*/


SELECT category_name AS NombreDeCategoria  
FROM categories; 

-- Ejercicio 16: Selecciona envios con retraso:

SELECT order_id, order_date, shipped_date, DATE_ADD(shipped_date, INTERVAL 5 DAY) as FechaRetrasada 
FROM orders;

-- Ejercicio 17: Selecciona los productos más rentables:

SELECT product_id, product_name, unit_price 
FROM products  
WHERE unit_price BETWEEN 15 AND 50;

-- Ejercicio 18:  Selecciona los productos con unos precios dados:

SELECT *   
FROM products   
WHERE unit_price IN (20, 18, 19);


    