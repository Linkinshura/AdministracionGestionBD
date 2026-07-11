INSERT INTO Persona (dni, nombre, apellido, telefono, email) VALUES
(40111222, 'Juan', 'Perez', '1134567890', 'juan@gmail.com'),
(40222333, 'Maria', 'Gomez', '1145678901', 'maria@gmail.com'),
(40333444, 'Carlos', 'Lopez', '1156789012', 'carlos@gmail.com'),
(40444555, 'Ana', 'Martinez', '1167890123', 'ana@gmail.com'),
(40555666, 'Pedro', 'Fernandez', '1178901234', 'pedro@gmail.com'),
(40666777, 'Lucia', 'Romero', '1189012345', 'lucia@gmail.com');

INSERT INTO Socio (dni, estado) VALUES
(40111222, 'Habilitado'),
(40222333, 'Inhabilitado');

INSERT INTO NoSocio (dni) VALUES
(40333444),
(40444555);

INSERT INTO Profesor (dni, sueldo) VALUES
(40555666, 450000.00),
(40666777, 480000.00);

INSERT INTO Salon (nombre, capacidad) VALUES
('Salon A', 30),
('Pileta', 20);

INSERT INTO Actividad (nombre, descripcion) VALUES
('Musculacion', 'Entrenamiento con pesas'),
('Natacion', 'Clases de natacion');

INSERT INTO Clase (id_actividad, legajo, id_salon, dia, horario) VALUES
(1, 1, 1, 'Lunes', '09:00:00'),
(2, 2, 2, 'Miercoles', '18:00:00'),
(1, 1, 1, 'Viernes', '10:00:00'),
(2, 2, 2, 'Sabado', '11:30:00');

INSERT INTO Inscripcion (id_clase, nro_carnet, id_no_socio, fecha) VALUES
(1, 1, NULL, '2026-07-01'),
(2, 2, NULL, '2026-07-02'),
(3, NULL, 1, '2026-07-03'),
(4, NULL, 2, '2026-07-04');

INSERT INTO Cuota (nro_carnet, fecha_emision, fecha_vencimiento, importe, pagada) VALUES
(1, '2026-07-01', '2026-08-01', 35000.00, TRUE),
(2, '2026-07-01', '2026-08-01', 35000.00, FALSE);

INSERT INTO PaseDiario (id_no_socio, fecha, importe) VALUES
(1, '2026-07-03', 5000.00),
(2, '2026-07-04', 5000.00);

INSERT INTO AsistenciaProfesor (legajo, fecha, hora_entrada) VALUES
(1, '2026-07-01', '08:00:00'),
(2, '2026-07-01', '17:30:00');

INSERT INTO TurnoNutricion (nro_carnet, fecha, hora) VALUES
(1, '2026-07-10', '10:00:00'),
(2, '2026-07-11', '11:00:00');

INSERT INTO FichaMedica (nro_carnet, carga_permitida, observaciones) VALUES
(1, 'Moderada', 'Sin observaciones'),
(2, 'Liviana', 'Evitar ejercicios de alto impacto');