CREATE DATABASE IF NOT EXISTS BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE IF NOT EXISTS Autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Libros (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS Prestamos (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_entrega DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    CONSTRAINT fk_Prestamos_Usuarios FOREIGN KEY (id_usuario) 
        REFERENCES Usuarios (id_usuario) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_Prestamos_Libros FOREIGN KEY (id_libro) 
        REFERENCES Libros (id_libro) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Autores_has_Libros (
    Autores_id_autor INT NOT NULL,
    Libros_id_libro INT NOT NULL,
    PRIMARY KEY (Autores_id_autor, Libros_id_libro),
    INDEX fk_Autores_has_Libros_Libros1_idx (Libros_id_libro ASC),
    INDEX fk_Autores_has_Libros_Autores1_idx (Autores_id_autor ASC),
    CONSTRAINT fk_Autores_has_Libros_Autores1
        FOREIGN KEY (Autores_id_autor)
        REFERENCES Autores (id_autor)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_Autores_has_Libros_Libros1
        FOREIGN KEY (Libros_id_libro)
        REFERENCES Libros (id_libro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;