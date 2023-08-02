drop database grandes_almacenes;

create database grandes_almacenes;
use grandes_almacenes;

CREATE TABLE productos (
	cod_producto int auto_increment,
	nombre nvarchar(100), 
	precio int,
    primary key(cod_producto)
);
CREATE TABLE cajeros (
	cod_cajero int auto_increment, 
	nom_apels nvarchar(255),
    primary key (cod_cajero)
);
CREATE TABLE maquinas_registradoras (
	cod_maquina_registradora int auto_increment,  
	piso int,
    primary key(cod_maquina_registradora)
);
CREATE TABLE venta (
	cajero int, 
	maquina int, 
	producto int,
    primary key (cajero, maquina, producto),
    foreign key (cajero) references cajeros (cod_cajero)
		on delete cascade
        on update cascade,
	foreign key (maquina) references maquinas_registradoras (cod_maquina_registradora)
		on delete cascade
        on update cascade,
	foreign key (producto) references productos (cod_producto)
		on delete cascade
        on update cascade
);

 /* --------------------- DML -------------------- */
 INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10),
    ('Producto 2', 15),
    ('Producto 3', 20),
    ('Producto 4', 25),
    ('Producto 5', 30),
    ('Producto 6', 35),
    ('Producto 7', 40),
    ('Producto 8', 45),
    ('Producto 9', 50),
    ('Producto 10', 55);
    
INSERT INTO cajeros (nom_apels) VALUES
    ('Cajero 1'),
    ('Cajero 2'),
    ('Cajero 3'),
    ('Cajero 4'),
    ('Cajero 5'),
    ('Cajero 6'),
    ('Cajero 7'),
    ('Cajero 8'),
    ('Cajero 9'),
    ('Cajero 10');
    
INSERT INTO maquinas_registradoras (piso) VALUES
    (1),
    (2),
    (1),
    (3),
    (2),
    (1),
    (3),
    (2),
    (4),
    (1);
    
INSERT INTO venta (cajero, maquina, producto) VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);
    
        
UPDATE productos set nombre = 'Producto A' where nombre = 'Producto 1';
    
DELETE from cajeros limit 1;