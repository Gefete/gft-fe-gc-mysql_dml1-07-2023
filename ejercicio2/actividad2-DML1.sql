drop database piezas_proveedores;

create database piezas_proveedores;
use piezas_proveedores;

CREATE TABLE piezas (
	cod_pieza int auto_increment, 
	nombre nvarchar(100),
    primary key (cod_pieza)
);
CREATE TABLE proveedores (
	id_proveedor char(4), 
	nombre nvarchar(100),
    primary key (id_proveedor)
);
CREATE TABLE suministra (
	cod_pieza int, 
	id_proveedor char(4), 
	precio int,
    primary key (cod_pieza, id_proveedor),
    foreign key (cod_pieza) references piezas (cod_pieza)
		on update cascade
        on delete cascade,
	foreign key (id_proveedor) references proveedores (id_proveedor)
		on update cascade
        on delete cascade
);

/* --------------------------- DML ------------------------- */

INSERT INTO piezas (nombre) VALUES
    ('Tuerca'),
    ('Perno'),
    ('Arandela'),
    ('Resorte'),
    ('Engranaje'),
    ('Tornillo'),
    ('Rodamiento'),
    ('Eje'),
    ('Cadena'),
    ('Correa');
    
INSERT INTO proveedores (id_proveedor, nombre) VALUES
    ('P001', 'Proveedor A'),
    ('P002', 'Proveedor B'),
    ('P003', 'Proveedor C'),
    ('P004', 'Proveedor D'),
    ('P005', 'Proveedor E'),
    ('P006', 'Proveedor F'),
    ('P007', 'Proveedor G'),
    ('P008', 'Proveedor H'),
    ('P009', 'Proveedor I'),
    ('P010', 'Proveedor J');
    
INSERT INTO suministra (cod_pieza, id_proveedor, precio) VALUES
    (1, 'P001', 10),
    (2, 'P002', 15),
    (3, 'P003', 8),
    (4, 'P004', 12),
    (5, 'P005', 25),
    (6, 'P006', 7),
    (7, 'P007', 18),
    (8, 'P008', 30),
    (9, 'P009', 5),
    (10, 'P010', 20);
    
UPDATE piezas set nombre = 'Tuerca con rosca cerrada' where nombre = 'Tuerca';
    
DELETE from proveedores limit 1;