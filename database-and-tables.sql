/*
DROP TABLE IF exists empleados;
DROP TABLE IF exists vacaciones;
DROP TABLE IF exists relacion;
*/

-- 0. CRacion de base de datos

	CREATE DATABASE "DataKnow"
    	WITH
    	OWNER = postgres
    	ENCODING = 'UTF8'
    	CONNECTION LIMIT = -1
    	IS_TEMPLATE = False;


-- 1. Crear las tablas que usuarames

	CREATE TABLE vacaciones (
	  id INTEGER PRIMARY KEY,
	  empleado_id INTEGER NOT NULL,
	  fecha_inicio DATE NOT NULL,
	  fecha_fin DATE NOT NULL,
	  estado CHAR(1),
	  cantidad_dias INTEGER );

	CREATE TABLE empleados (
	  id INTEGER PRIMARY KEY,
	  nombre VARCHAR(255) NOT NULL,
	  apellido VARCHAR(59), 
	  sexo CHAR(1),
	  fecha_nacimiento DATE,
	  salario NUMERIC(10,2) );

	CREATE TABLE relacion (
	  vacaciones_id INTEGER NOT NULL,
	  empleados_id INTEGER NOT NULL,
	  PRIMARY KEY (vacaciones_id, empleados_id),
	  FOREIGN KEY (vacaciones_id) REFERENCES vacaciones (id),
	  FOREIGN KEY (empleados_id) REFERENCES empleados (id) );



-- 3. Mostrar tablas creadas
	Select * from empleados;
	Select * from vacaciones;
	Select * from relacion;
	


-- 2. Insertar valores en las tablas

	INSERT INTO empleados (id, nombre, apellido, sexo, fecha_nacimiento, salario) VALUES 
	(1,'JUAN','PELAEZ','M','1985-01-29',3500000),
	(2,'ANDRES','GARCIA','M','1975-05-22',5500000),
	(3,'LAURA','PEREZ','F','1991-09-10',2500000),
	(4,'PEPE','MARTINEZ','M','1987-12-01',3800000),
	(5,'MARGARITA','CORRALES','F','1990-07-02',4500000);


	INSERT INTO VACACIONES (id, empleado_id, fecha_inicio, fecha_fin, estado, cantidad_dias) 
	VALUES
	(1,1,'2019-07-01','2019-07-15','A',14),
	(2,2,'2019-03-01','2019-03-15','R',14),
	(3,2,'2019-04-01','2019-04-15','A',14),
	(4,2,'2019-08-14','2019-08-20','A',6),
	(5,3,'2019-08-20','2019-08-25','A',5),
    (6,3,'2019-12-20','2019-12-31','A',11);


	INSERT INTO relacion (vacaciones_id, empleados_id)
	SELECT id, empleado_id FROM vacaciones;
	
