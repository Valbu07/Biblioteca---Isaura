
CREATE DATABASE IF NOT EXISTS discografia;


USE discografia;


CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL UNIQUE,
    contraseña_hash VARCHAR(255) NOT NULL, -- Almacenar el hash de la contraseña
    email VARCHAR(255) UNIQUE,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(255) NOT NULL
);

-- 5. Crear la tabla de Álbumes
CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    año_produccion INT,
    descripcion TEXT,
    id_artista INT,
    medio_grabacion VARCHAR(100),
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);


CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    año_produccion INT,
    descripcion TEXT,
    id_artista INT,
    id_album INT,
    medio_grabacion VARCHAR(100),
    duracion_segundos INT NOT NULL, -- Duración en segundos
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista),
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album)
);
INSERT INTO Artistas (nombre_artista) VALUES
('Queen'),
('The Beatles'),
('Michael Jackson'),
('Adele'),
('Shakira');
INSERT INTO Usuarios (nombre_usuario, contraseña_hash, email) VALUES
('admin', 'password_segura_hash_del_admin', 'admin@ejemplo.com'),
('usuario1', 'hash_de_contraseña_usuario1', 'usuario1@ejemplo.com'),
('juanperez', 'hash_de_contraseña_juanperez', 'juan.perez@email.com');
INSERT INTO Albumes (titulo, año_produccion, descripcion, id_artista, medio_grabacion) VALUES
('A Night at the Opera', 1975, 'Cuarto álbum de estudio de Queen, conocido por Bohemian Rhapsody.', 1, 'Vinilo'),
('Abbey Road', 1969, 'Undécimo álbum de estudio de The Beatles.', 2, 'Digital'),
('Thriller', 1982, 'El álbum más vendido de todos los tiempos.', 3, 'CD'),
('21', 2011, 'Segundo álbum de estudio de Adele, con éxitos como Rolling in the Deep.', 4, 'CD'),
('El Dorado', 2017, 'Undécimo álbum de estudio de Shakira, con canciones en español e inglés.', 5, 'Digital');

SELECT A.titulo AS Album, A.año_produccion, AR.nombre_artista
FROM Albumes A
JOIN Artistas AR ON A.id_artista = AR.id_artista;

SELECT C.titulo AS Cancion, C.año_produccion, AL.titulo AS Album, AR.nombre_artista
FROM Canciones C
JOIN Albumes AL ON C.id_album = AL.id_album
JOIN Artistas AR ON C.id_artista = AR.id_artista;

SELECT nombre_usuario, email, fecha_registro
FROM Usuarios;

SELECT * 
FROM Artistas;

SELECT 
  a.id_album,
  a.titulo       AS album,
  a.año_produccion,
  ar.nombre_artista
FROM Albumes AS a
JOIN Artistas AS ar USING (id_artista);

SELECT nombre_usuario, fecha_registro
FROM Usuarios
WHERE fecha_registro > '2024-01-01';

SELECT titulo, año_produccion
FROM Albumes
WHERE año_produccion = (SELECT MAX(año_produccion) FROM Albumes);

SELECT id_usuario, nombre_usuario, email, fecha_registro
FROM Usuarios;






