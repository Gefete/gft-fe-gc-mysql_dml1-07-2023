drop database Directores;

create database Directores;
use Directores;

CREATE TABLE Despachos (
	numero int auto_increment, 
	capacidad int,
    primary key (numero)
);
CREATE TABLE Directores (
	dni varchar(8), 
	nom_apels nvarchar(255), 
	dni_jefe varchar(8), 
	despacho int,
    primary key (dni),
    foreign key (dni_jefe) references Directores (dni)
		on delete cascade
        on update cascade,
	foreign key (despacho) references Despachos (numero)
		on delete cascade
        on update cascade
);

/* ------------------------ DML ------------------------- */
INSERT INTO Despachos (capacidad) VALUES
    (4),
    (3),
    (5),
    (2),
    (6),
    (4),
    (3),
    (5),
    (4),
    (3);
    
INSERT INTO Directores (dni, nom_apels, dni_jefe, despacho) VALUES
    ('12345678', 'Juan Pérez', NULL, 1),
    ('23456789', 'María López', '12345678', 2),
    ('34567890', 'Carlos Rodríguez', '12345678', 3),
    ('45678901', 'Ana Martínez', '23456789', 4),
    ('56789012', 'David García', '23456789', 5),
    ('67890123', 'Elena Sánchez', '23456789', 6),
    ('78901234', 'Pedro González', '34567890', 7),
    ('89012345', 'Laura Fernández', '34567890', 8),
    ('90123456', 'Sergio Ramírez', '34567890', 9),
    ('01234567', 'Luisa Torres', '45678901', 10);
    
    UPDATE Directores set nom_apels = 'Pablo Rodríguez' where nom_apels = 'Juan Pérez';
    
    DELETE from Directores limit 1;