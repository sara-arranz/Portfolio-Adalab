-- CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

CREATE TABLE tabla_zapatillas (
	id_zapatilla int,
    modelo varchar(45) not null,
    color varchar (45) not null,
    primary key (id_zapatilla)
);

CREATE TABLE clientes (
	id_cliente int,
    nombre varchar(45) not null,
    num_telefono int not null,
    email varchar(45),
    direccion varchar(45) not null,
    ciudad varchar(45),
    provincia varchar(45) not null,
    pais varchar(45) not null,
    cp varchar(45) not null,
    primary key (id_cliente)

);

CREATE TABLE empleados (
	id_empleado int,
    nombre varchar(45) not null,
    tienda varchar(45) not null,
    salario int,
    fecha_incorporacion date not null,
    primary key (id_empleado)

);

CREATE TABLE facturas (
	id_factura int,
    num_factura varchar(45) not null,
    fecha date not null,
    id_zapatilla int not null,
    id_empleado int not null,
    id_cliente int not null,
    
    primary key (id_factura, id_zapatilla, id_empleado, id_cliente),
    
    constraint fK_1
		foreign key (id_zapatilla)
		references tabla_zapatillas (id_zapatilla),
    
	constraint fk_2
		foreign key (id_empleado)
		references empleados(id_empleado),
    
    constraint fk_3
		foreign key (id_cliente)
		references clientes (id_cliente)

);
    
ALTER TABLE tabla_zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL;
    
    
 ALTER TABLE tabla_zapatillas
 ADD COLUMN talla INT NOT NULL;
    
ALTER TABLE empleados
MODIFY COLUMN salario FLOAT NOT NULL;

ALTER TABLE clientes
DROP COLUMN pais;

ALTER TABLE facturas
ADD COLUMN total FLOAT;


INSERT INTO tabla_zapatillas(id_zapatilla,modelo,color,marca,talla)
VALUES (1,"XQYUN","Negro","Nike",42);
	
INSERT INTO tabla_zapatillas(id_zapatilla,modelo,color,marca,talla)  
VALUES (2,"UOPMN","Rosas","Nike",39),
	(3,"OPNYT","Verdes","Adidas",35);
    
SELECT *
FROM tabla_zapatillas;


INSERT INTO empleados (id_empleado,nombre,tienda,salario,fecha_incorporacion)
VALUES (1,"Laura","Alcobendas",25897,"2010-09-03"),
	(2,"Maria","Sevilla",0.0,"2001-04-11"),
    (3,"Ester","Oviedo",30165.98,"2000-11-29");

SELECT * 
FROM empleados;
 
 INSERT INTO clientes (id_cliente,nombre,num_telefono,email,direccion,ciudad,provincia,cp)
 VALUES (1,"Monica","1234567289","monica@email.com","Calle Felicidad","Mostoles","Madrid","28176"),
	(2,"Lorena","289345678","lorena@email.com","Calle Alegria","Barcelona","Barcelona","12346"),
    (3,"Carmen","298463759","carmen@email.com","Calle del Color","Vigo","Pontevedra","23456");
    
SELECT * 
FROM clientes;

INSERT INTO facturas (id_factura,num_factura,fecha,id_zapatilla,id_empleado,id_cliente,total)
VALUES(1,"123","2001-12-11",1,2,1,54.98),
	(2,"1234","2005-05-23",1,1,3,89.91),
    (3,"12345","2015-09-18",2,3,3,76.23);
    
SELECT *
FROM facturas;

UPDATE tabla_zapatillas
SET color="Amarillas"
WHERE color="Rosas";

SELECT *
FROM tabla_zapatillas;

SET SQL_SAFE_UPDATES = 0;

UPDATE empleados 
SET Tienda = "Madrid"
where Nombre = "Laura";

SELECT *
FROM empleados;


UPDATE clientes 
SET num_telefono = 123456728
where Nombre = "Monica";


UPDATE facturas 
SET total = 89.91
where id_zapatilla =2;


