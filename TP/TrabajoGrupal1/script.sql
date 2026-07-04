DROP DATABASE IF EXISTS club_deportivo;
CREATE DATABASE club_deportivo;
USE club_deportivo;

CREATE TABLE persona (
    dni INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE socio (
    dni INT PRIMARY KEY,
    nro_carnet INT NOT NULL AUTO_INCREMENT UNIQUE,
    estado_habilitacion ENUM('Habilitado','Inhabilitado') NOT NULL DEFAULT 'Habilitado',
    fecha_alta DATE NOT NULL DEFAULT (CURRENT_DATE),
    fecha_vencimiento_cuota DATE NOT NULL,
    FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE
);

CREATE TABLE no_socio (
    dni INT PRIMARY KEY,
    FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE
);

CREATE TABLE profesor (
    dni INT PRIMARY KEY,
    legajo INT NOT NULL AUTO_INCREMENT UNIQUE,
    sueldo_mensual DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE
);

CREATE TABLE actividad (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    descripcion VARCHAR(200)
);

CREATE TABLE salon (
    id_salon INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    capacidad INT NOT NULL
);

CREATE TABLE clase (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_actividad INT NOT NULL,
    dni_profesor INT NOT NULL,
    id_salon INT NOT NULL,
    dia_semana ENUM('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad),
    FOREIGN KEY (dni_profesor) REFERENCES profesor(dni),
    FOREIGN KEY (id_salon) REFERENCES salon(id_salon)
);

CREATE TABLE pase_diario (
    id_pase INT PRIMARY KEY AUTO_INCREMENT,
    dni_no_socio INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (dni_no_socio) REFERENCES no_socio(dni),
    UNIQUE (dni_no_socio, fecha)
);

CREATE TABLE cuota (
    id_cuota INT PRIMARY KEY AUTO_INCREMENT,
    dni_socio INT NOT NULL,
    periodo_mes TINYINT NOT NULL,
    periodo_anio SMALLINT NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    fecha_pago DATE,
    monto DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente','Pagada','Vencida') NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (dni_socio) REFERENCES socio(dni),
    UNIQUE (dni_socio, periodo_mes, periodo_anio)
);

CREATE TABLE inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    dni_persona INT NOT NULL,
    id_clase INT NOT NULL,
    fecha_inscripcion DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (dni_persona) REFERENCES persona(dni),
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase),
    UNIQUE (dni_persona, id_clase)
);

CREATE TABLE asistencia_profesor (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    dni_profesor INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    FOREIGN KEY (dni_profesor) REFERENCES profesor(dni),
    UNIQUE (dni_profesor, fecha)
);

CREATE TABLE turno_nutricion (
    id_turno INT PRIMARY KEY AUTO_INCREMENT,
    dni_socio INT NOT NULL,
    fecha_turno DATE NOT NULL,
    hora_turno TIME NOT NULL,
    estado ENUM('Solicitado','Atendido','Cancelado') NOT NULL DEFAULT 'Solicitado',
    FOREIGN KEY (dni_socio) REFERENCES socio(dni)
);

CREATE TABLE ficha_medica (
    id_ficha INT PRIMARY KEY AUTO_INCREMENT,
    id_turno INT NOT NULL UNIQUE,
    carga_permitida ENUM('Liviana','Moderada','Intensa') NOT NULL,
    observaciones VARCHAR(500),
    fecha_confeccion DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (id_turno) REFERENCES turno_nutricion(id_turno)
);
