DROP DATABASE IF EXISTS ClubDeportivo;
CREATE DATABASE IF NOT EXISTS ClubDeportivo;
USE ClubDeportivo;

CREATE TABLE Persona (
    dni INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE EstadoSocio (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Socio (
    nro_carnet INT AUTO_INCREMENT PRIMARY KEY,
    dni INT NOT NULL UNIQUE,
    id_estado INT NOT NULL,
    FOREIGN KEY (dni)
        REFERENCES Persona(dni)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_estado)
        REFERENCES EstadoSocio(id_estado)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE NoSocio (
    id_no_socio INT AUTO_INCREMENT PRIMARY KEY,
    dni INT NOT NULL UNIQUE,
    FOREIGN KEY (dni)
        REFERENCES Persona(dni)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Profesor (
    legajo INT AUTO_INCREMENT PRIMARY KEY,
    dni INT NOT NULL UNIQUE,
    sueldo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (dni)
        REFERENCES Persona(dni)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Salon (
    id_salon INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL
);

CREATE TABLE Actividad (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

CREATE TABLE DiaSemana (
    id_dia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_actividad INT NOT NULL,
    legajo INT NOT NULL,
    id_salon INT NOT NULL,
    id_dia INT NOT NULL,
    horario TIME NOT NULL,
    FOREIGN KEY (id_actividad)
        REFERENCES Actividad(id_actividad)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (legajo)
        REFERENCES Profesor(legajo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_salon)
        REFERENCES Salon(id_salon)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dia)
        REFERENCES DiaSemana(id_dia)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_clase INT NOT NULL,
    nro_carnet INT NULL,
    id_no_socio INT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_clase)
        REFERENCES Clase(id_clase)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (nro_carnet)
        REFERENCES Socio(nro_carnet)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_no_socio)
        REFERENCES NoSocio(id_no_socio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Cuota (
    id_cuota INT AUTO_INCREMENT PRIMARY KEY,
    nro_carnet INT NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    pagada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (nro_carnet)
        REFERENCES Socio(nro_carnet)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE PaseDiario (
    id_pase INT AUTO_INCREMENT PRIMARY KEY,
    id_no_socio INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_no_socio)
        REFERENCES NoSocio(id_no_socio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE AsistenciaProfesor (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    legajo INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    FOREIGN KEY (legajo)
        REFERENCES Profesor(legajo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE TurnoNutricion (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    nro_carnet INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    FOREIGN KEY (nro_carnet)
        REFERENCES Socio(nro_carnet)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE CargaActividad (
    id_carga INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE FichaMedica (
    id_ficha INT AUTO_INCREMENT PRIMARY KEY,
    nro_carnet INT NOT NULL,
    id_carga INT NOT NULL,
    observaciones VARCHAR(255),
    FOREIGN KEY (nro_carnet)
        REFERENCES Socio(nro_carnet)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_carga)
        REFERENCES CargaActividad(id_carga)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
