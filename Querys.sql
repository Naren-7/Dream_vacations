-- 1. Seleccione nombre, apellido y salario de todos los empleados que ganen más de 4 millones.
	
	-- Tablas
	select * from empleados;
	select * from vacaciones;
	select * from relacion;
	
	
	select nombre, apellido, salario
	from empleados
	where salario > 4000000;
	
-- 2. Cuente los empleados por sexo.

	SELECT sexo, COUNT(*)
	FROM empleados
	GROUP BY sexo;
	
	
-- 3. Seleccione los empleados que no han hecho solicitud de vacaciones.

	SELECT *
	FROM empleados
	WHERE id NOT IN (SELECT empleado_id FROM vacaciones);
	
	
-- 4. Seleccione los empleados que tengan más de una solicitud de vacaciones y muestre cuantas solicitudes tienen los que cumplen.
	
	SELECT empleado_id , COUNT(*) AS num_solicitudes
	FROM vacaciones
	GROUP BY empleado_id
	HAVING COUNT(*) > 1;
	
	
-- 5.  Determine el salario promedio de los empleados.
	
	SELECT AVG(salario) AS promdeio
	FROM empleados;
	
	-- # Proemdio por genero, por si tines la curiosidad
	SELECT sexo, AVG(salario)
	FROM empleados
	GROUP BY sexo;
	
	
-- 6. Determine la cantidad de días promedio solicitados de vacaciones por cada empleado

	SELECT e.nombre, e.apellido, AVG(v.cantidad_dias) as dias_promedio
	FROM empleados e
	JOIN relacion r ON e.id = r.empleados_id
	JOIN vacaciones v ON r.vacaciones_id = v.id
	GROUP BY e.nombre, e.apellido


-- 7.  Seleccione el empleado que mayor cantidad de días de vacaciones ha solicitado, muestre el nombre, apellido y cantidad de días totales solicitados.

	SELECT e.nombre, e.apellido, SUM(v.cantidad_dias) as dias_totales
	FROM empleados e
	JOIN relacion r ON e.id = r.empleados_id
	JOIN vacaciones v ON r.vacaciones_id = v.id
	GROUP BY e.nombre, e.apellido
	ORDER BY dias_totales DESC
	LIMIT 1;



-- 8. Consulte la cantidad de días aprobados y rechazados por cada empleado, en caso de no tener solicitudes mostrar 0.

	SELECT e.nombre, e.apellido,
    SUM(CASE WHEN v.estado = 'A' THEN v.cantidad_dias ELSE 0 END) as dias_aprobados,
    SUM(CASE WHEN v.estado = 'R' THEN v.cantidad_dias ELSE 0 END) as dias_rechazados
	FROM empleados e
	LEFT JOIN relacion r ON e.id = r.empleados_id
	LEFT JOIN vacaciones v ON r.vacaciones_id = v.id
	GROUP BY e.nombre, e.apellido
