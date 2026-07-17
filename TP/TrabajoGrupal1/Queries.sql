-- 1. Listado de personas
SELECT * FROM Persona;

-- 2. Listado de socios
SELECT
    s.nro_carnet,
    p.nombre,
    p.apellido,
    s.estado
FROM Socio s
JOIN Persona p ON s.dni = p.dni;

-- 3. Estado actual de un socio
SELECT
    p.nombre,
    p.apellido,
    s.estado
FROM Socio s
JOIN Persona p ON s.dni = p.dni
WHERE s.nro_carnet = 1;

-- 4. Listado de profesores
SELECT
    pr.legajo,
    p.nombre,
    p.apellido,
    pr.sueldo
FROM Profesor pr
JOIN Persona p ON pr.dni = p.dni;

-- 5. Listado de actividades
SELECT * FROM Actividad;

-- 6. Clases programadas
SELECT
    c.id_clase,
    a.nombre AS actividad,
    c.dia,
    c.horario,
    s.nombre AS salon
FROM Clase c
JOIN Actividad a ON c.id_actividad = a.id_actividad
JOIN Salon s ON c.id_salon = s.id_salon;

-- 7. Listado de alumnos inscriptos
SELECT
    i.id_inscripcion,
    p.nombre,
    p.apellido,
    a.nombre AS actividad,
    c.dia,
    c.horario
FROM Inscripcion i
JOIN Socio so ON i.nro_carnet = so.nro_carnet
JOIN Persona p ON so.dni = p.dni
JOIN Clase c ON i.id_clase = c.id_clase
JOIN Actividad a ON c.id_actividad = a.id_actividad;

-- 8. Vencimientos diarios
SELECT
    p.nombre,
    p.apellido,
    c.fecha_vencimiento
FROM Cuota c
JOIN Socio s ON c.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni
WHERE c.fecha_vencimiento = CURDATE();

-- 9. Cuotas pendientes
SELECT *
FROM Cuota
WHERE pagada = FALSE;

-- 10. Cuotas pagadas
SELECT *
FROM Cuota
WHERE pagada = TRUE;

-- 11. Asistencia de profesores
SELECT
    p.nombre,
    p.apellido,
    a.fecha,
    a.hora_entrada
FROM AsistenciaProfesor a
JOIN Profesor pr ON a.legajo = pr.legajo
JOIN Persona p ON pr.dni = p.dni;

-- 12. Turnos de nutrición
SELECT
    p.nombre,
    p.apellido,
    t.fecha,
    t.hora
FROM TurnoNutricion t
JOIN Socio s ON t.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni;

-- 13. Fichas médicas
SELECT
    p.nombre,
    p.apellido,
    f.carga_permitida,
    f.observaciones
FROM FichaMedica f
JOIN Socio s ON f.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni;

-- 14. Cantidad de socios
SELECT COUNT(*) AS total_socios
FROM Socio;

-- 15. Cantidad de profesores
SELECT COUNT(*) AS total_profesores
FROM Profesor;

-- 16. Cantidad de actividades
SELECT COUNT(*) AS total_actividades
FROM Actividad;

-- 17. Clases por profesor
SELECT
    p.nombre,
    p.apellido,
    COUNT(c.id_clase) AS cantidad_clases
FROM Profesor pr
JOIN Persona p ON pr.dni = p.dni
LEFT JOIN Clase c ON pr.legajo = c.legajo
GROUP BY pr.legajo;

-- 18. Socios habilitados
SELECT
    p.nombre,
    p.apellido
FROM Socio s
JOIN Persona p ON s.dni = p.dni
WHERE s.estado = 'Habilitado';

-- 19. Socios inhabilitados
SELECT
    p.nombre,
    p.apellido
FROM Socio s
JOIN Persona p ON s.dni = p.dni
WHERE s.estado = 'Inhabilitado';

-- 20. Clases con su profesor y salón
SELECT
    a.nombre AS actividad,
    p.nombre,
    p.apellido,
    c.dia,
    c.horario,
    s.nombre AS salon
FROM Clase c
JOIN Actividad a ON c.id_actividad = a.id_actividad
JOIN Profesor pr ON c.legajo = pr.legajo
JOIN Persona p ON pr.dni = p.dni
JOIN Salon s ON c.id_salon = s.id_salon;