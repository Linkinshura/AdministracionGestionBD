-- 1. Listado de todas las personas
SELECT * FROM Persona;

-- 2. Listado de socios con su estado
SELECT
    s.nro_carnet,
    p.nombre,
    p.apellido,
    es.descripcion AS estado
FROM Socio s
JOIN Persona p ON s.dni = p.dni
JOIN EstadoSocio es ON s.id_estado = es.id_estado;

-- 3. Estado actual de un socio
SELECT
    p.nombre,
    p.apellido,
    es.descripcion AS estado
FROM Socio s
JOIN Persona p ON s.dni = p.dni
JOIN EstadoSocio es ON s.id_estado = es.id_estado
WHERE s.nro_carnet = 1;

-- 4. Vencimientos diarios
SELECT
    c.id_cuota,
    p.nombre,
    p.apellido,
    c.fecha_vencimiento
FROM Cuota c
JOIN Socio s ON c.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni
WHERE c.fecha_vencimiento = CURDATE();

-- 5. Cuotas pagadas
SELECT *
FROM Cuota
WHERE pagada = TRUE;

-- 6. Cuotas pendientes
SELECT *
FROM Cuota
WHERE pagada = FALSE;

-- 7. Listado de profesores
SELECT
    pr.legajo,
    pe.nombre,
    pe.apellido,
    pr.sueldo
FROM Profesor pr
JOIN Persona pe ON pr.dni = pe.dni;

-- 8. Asistencia de profesores
SELECT
    pe.nombre,
    pe.apellido,
    ap.fecha,
    ap.hora_entrada
FROM AsistenciaProfesor ap
JOIN Profesor pr ON ap.legajo = pr.legajo
JOIN Persona pe ON pr.dni = pe.dni;

-- 9. Listado de actividades
SELECT * FROM Actividad;

-- 10. Clases programadas
SELECT
    c.id_clase,
    a.nombre AS actividad,
    ds.nombre AS dia,
    c.horario,
    sa.nombre AS salon
FROM Clase c
JOIN Actividad a ON c.id_actividad = a.id_actividad
JOIN DiaSemana ds ON c.id_dia = ds.id_dia
JOIN Salon sa ON c.id_salon = sa.id_salon;

-- 11. Listado de alumnos inscriptos
SELECT
    i.id_inscripcion,
    a.nombre AS actividad,
    c.horario,
    COALESCE(ps.nombre, pns.nombre) AS nombre,
    COALESCE(ps.apellido, pns.apellido) AS apellido
FROM Inscripcion i
JOIN Clase c ON i.id_clase = c.id_clase
JOIN Actividad a ON c.id_actividad = a.id_actividad
LEFT JOIN Socio s ON i.nro_carnet = s.nro_carnet
LEFT JOIN Persona ps ON s.dni = ps.dni
LEFT JOIN NoSocio ns ON i.id_no_socio = ns.id_no_socio
LEFT JOIN Persona pns ON ns.dni = pns.dni;

-- 12. No socios con pase diario
SELECT
    p.nombre,
    p.apellido,
    pd.fecha,
    pd.importe
FROM PaseDiario pd
JOIN NoSocio ns ON pd.id_no_socio = ns.id_no_socio
JOIN Persona p ON ns.dni = p.dni;

-- 13. Turnos de nutrición
SELECT
    p.nombre,
    p.apellido,
    tn.fecha,
    tn.hora
FROM TurnoNutricion tn
JOIN Socio s ON tn.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni;

-- 14. Fichas médicas
SELECT
    p.nombre,
    p.apellido,
    ca.descripcion AS carga_permitida,
    fm.observaciones
FROM FichaMedica fm
JOIN Socio s ON fm.nro_carnet = s.nro_carnet
JOIN Persona p ON s.dni = p.dni
JOIN CargaActividad ca ON fm.id_carga = ca.id_carga;

-- 15. Cantidad de socios
SELECT COUNT(*) AS total_socios
FROM Socio;

-- 16. Cantidad de profesores
SELECT COUNT(*) AS total_profesores
FROM Profesor;

-- 17. Cantidad de actividades
SELECT COUNT(*) AS total_actividades
FROM Actividad;

-- 18. Cantidad de clases por actividad
SELECT
    a.nombre,
    COUNT(*) AS cantidad_clases
FROM Clase c
JOIN Actividad a ON c.id_actividad = a.id_actividad
GROUP BY a.nombre;

-- 19. Socios habilitados
SELECT
    p.nombre,
    p.apellido
FROM Socio s
JOIN Persona p ON s.dni = p.dni
JOIN EstadoSocio es ON s.id_estado = es.id_estado
WHERE es.descripcion = 'Habilitado';

-- 20. Clases con su profesor
SELECT
    a.nombre AS actividad,
    pe.nombre,
    pe.apellido,
    ds.nombre AS dia,
    c.horario
FROM Clase c
JOIN Actividad a ON c.id_actividad = a.id_actividad
JOIN Profesor pr ON c.legajo = pr.legajo
JOIN Persona pe ON pr.dni = pe.dni
JOIN DiaSemana ds ON c.id_dia = ds.id_dia;
