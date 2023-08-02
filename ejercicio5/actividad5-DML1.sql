drop database investigadores;

create database investigadores;
use investigadores;

CREATE TABLE facultad (
	cod_facultad int auto_increment, 
	nombre nvarchar(100),
	primary key (cod_facultad)
);
CREATE TABLE investigadores (
	dni varchar(8), 
	nom_apels nvarchar(255), 
	facultad int,
    primary key(dni),
    foreign key (facultad) references facultad (cod_facultad)
		on delete cascade
        on update cascade
);
CREATE TABLE equipos (
	num_serie char(4), 
	nombre nvarchar(100), 
	facultad int,
    primary key(num_serie),
    foreign key (facultad) references facultad (cod_facultad)
		on delete cascade
        on update cascade
);
CREATE TABLE reserva (
	dni varchar(8), 
	num_serie char(4), 
	comienzo date, 
	fin date,
    primary key(dni, num_serie),
    foreign key (dni) references investigadores (dni)
		on delete cascade
        on update cascade,
	foreign key (num_serie) references equipos (num_serie)
		on delete cascade
        on update cascade
);

/* --------------------------- DML --------------------------------- */
INSERT INTO facultad (nombre) VALUES
    ('Facultad A'),
    ('Facultad B'),
    ('Facultad C'),
    ('Facultad D'),
    ('Facultad E'),
    ('Facultad F'),
    ('Facultad G'),
    ('Facultad H'),
    ('Facultad I'),
    ('Facultad J');
    
INSERT INTO investigadores (dni, nom_apels, facultad) VALUES
    ('12345678', 'Juan Pérez', 1),
    ('23456789', 'María López', 2),
    ('34567890', 'Carlos Rodríguez', 3),
    ('45678901', 'Ana Martínez', 4),
    ('56789012', 'David García', 5),
    ('67890123', 'Elena Sánchez', 6),
    ('78901234', 'Pedro González', 7),
    ('89012345', 'Laura Fernández', 8),
    ('90123456', 'Sergio Ramírez', 9),
    ('01234567', 'Luisa Torres', 10);
    
INSERT INTO equipos (num_serie, nombre, facultad) VALUES
    ('0001', 'Equipo 1', 1),
    ('0002', 'Equipo 2', 2),
    ('0003', 'Equipo 3', 3),
    ('0004', 'Equipo 4', 4),
    ('0005', 'Equipo 5', 5),
    ('0006', 'Equipo 6', 6),
    ('0007', 'Equipo 7', 7),
    ('0008', 'Equipo 8', 8),
    ('0009', 'Equipo 9', 9),
    ('0010', 'Equipo 10', 10);
    
INSERT INTO reserva (dni, num_serie, comienzo, fin) VALUES
    ('12345678', '0001', '2023-08-01', '2023-08-05'),
    ('23456789', '0002', '2023-08-02', '2023-08-06'),
    ('34567890', '0003', '2023-08-03', '2023-08-07'),
    ('45678901', '0004', '2023-08-04', '2023-08-08'),
    ('56789012', '0005', '2023-08-05', '2023-08-09'),
    ('67890123', '0006', '2023-08-06', '2023-08-10'),
    ('78901234', '0007', '2023-08-07', '2023-08-11'),
    ('89012345', '0008', '2023-08-08', '2023-08-12'),
    ('90123456', '0009', '2023-08-09', '2023-08-13'),
    ('01234567', '0010', '2023-08-10', '2023-08-14');
    
UPDATE investigadores set nom_apels = 'Pablo Rodríguez' where nom_apels = 'Juan Pérez';
    
DELETE from reserva limit 1;