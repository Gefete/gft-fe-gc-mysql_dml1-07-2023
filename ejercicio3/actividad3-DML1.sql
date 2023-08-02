drop database cientificos;

create database cientificos;
use cientificos;

CREATE TABLE cientificos (
	dni varchar(8), 
	nom_apels nvarchar(255),
    primary key(dni)
);
CREATE TABLE proyecto (
	id_proyecto char(4), 
	nombre nvarchar(255), 
	horas int,
    primary key(id_proyecto)
);
CREATE TABLE asignado_a (
	cientifico varchar(8), 
	proyecto char(4),
    primary key(cientifico, proyecto),
    foreign key (cientifico) references cientificos (dni)
		on delete cascade
        on update cascade,
	foreign key (proyecto) references proyecto (id_proyecto)
		on delete cascade
        on update cascade
);

/* ------------------ DML ------------------------- */
INSERT INTO cientificos (dni, nom_apels) VALUES
    ('12345678', 'Juan Pérez'),
    ('23456789', 'María López'),
    ('34567890', 'Carlos Rodríguez'),
    ('45678901', 'Ana Martínez'),
    ('56789012', 'David García'),
    ('67890123', 'Elena Sánchez'),
    ('78901234', 'Pedro González'),
    ('89012345', 'Laura Fernández'),
    ('90123456', 'Sergio Ramírez'),
    ('01234567', 'Luisa Torres');
    
INSERT INTO proyecto (id_proyecto, nombre, horas) VALUES
    ('P001', 'Proyecto A', 100),
    ('P002', 'Proyecto B', 150),
    ('P003', 'Proyecto C', 120),
    ('P004', 'Proyecto D', 200),
    ('P005', 'Proyecto E', 180),
    ('P006', 'Proyecto F', 130),
    ('P007', 'Proyecto G', 160),
    ('P008', 'Proyecto H', 140),
    ('P009', 'Proyecto I', 110),
    ('P010', 'Proyecto J', 170);
    
INSERT INTO asignado_a (cientifico, proyecto) VALUES
    ('12345678', 'P001'),
    ('23456789', 'P002'),
    ('34567890', 'P003'),
    ('45678901', 'P004'),
    ('56789012', 'P005'),
    ('67890123', 'P006'),
    ('78901234', 'P007'),
    ('89012345', 'P008'),
    ('90123456', 'P009'),
    ('01234567', 'P010');  
    
UPDATE cientificos set nom_apels = 'Pablo Rodríguez' where nom_apels = 'Juan Pérez';
    
DELETE from cientificos limit 1;