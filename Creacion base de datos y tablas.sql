CREATE DATABASE eventos;

USE eventos;

CREATE TABLE evento(
	ID_Evento INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Evento VARCHAR(30) NOT NULL
    , Descripcion VARCHAR(200) NULL 
    , Lugar VARCHAR(100) NOT NULL
    , Horaio_Inicio TIME
    , Horario_Fin TIME,
    PRIMARY KEY (Id_Evento)
);

CREATE TABLE cliente(
	ID_Cliente INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NULL
    , Telefono INT NOT NULL
    , Correo_Electronico VARCHAR(255) NULL,
    PRIMARY KEY (ID_Cliente)
);

CREATE TABLE contrato (
	ID_Contrato INT NOT NULL AUTO_INCREMENT UNIQUE
    , ID_Cliente INT NOT NULL
    , ID_Evento INT NOT NULL
    , Fecha_Inicio DATE NOT NULL
    , Fecha_Finalizacion DATE NOT NULL
    , Pago INT NOT NULL,
    PRIMARY KEY (ID_Contrato),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento)
);

CREATE TABLE servicios_extra(
	ID_Servicio INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , Nombre_Servicio VARCHAR(50) NULL
    , Descripcion VARCHAR(200) NULL,
    PRIMARY KEY (ID_Servicio),
    FOREIGN KEY (ID_Evento) REFERENCES Evento (ID_Evento)
);

CREATE TABLE invitado(
	ID_Invitado INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NOT NULL
    , DNI VARCHAR(12) NOT NULL UNIQUE
    , Edad INT NOT NULL,
    PRIMARY KEY (ID_Invitado)
);

CREATE TABLE entradas(
	ID_Entradas INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , ID_Invitado INT NOT NULL
    , Nombre_Invitado VARCHAR(30) NOT NULL
    , Apellido_Invitado VARCHAR(30) NOT NULL
    , DNI_Invitado VARCHAR(12) NOT NULL UNIQUE
    , Edad INT NOT NULL
    , Tipo_Entrada VARCHAR(30) NOT NULL 
    , Contraseña_Codigo VARCHAR(30) NULL
    , Precio_Entrada INT NULL,
    PRIMARY KEY (ID_Entradas),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento),
    FOREIGN KEY (ID_Invitado) REFERENCES invitado (ID_Invitado)
);

CREATE TABLE empleados(
	ID_Empleados INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NOT NULL
    , Correo_Electronico VARCHAR(255) NULL
    , Telefono INT NOT NULL
    , Disponibilidad CHAR(2) NOT NULL,
    PRIMARY KEY (ID_Empleados)
);

CREATE TABLE asignacion(
	ID_Asignacion INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Empleados INT NOT NULL
    , ID_Evento INT NOT NULL
    , Rol VARCHAR(40) NOT NULL
    , Inicio_Laboral TIME NOT NULL
    , Fin_Laboral TIME NOT NULL,
    PRIMARY KEY (ID_Asignacion),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento),
    FOREIGN KEY (ID_Empleados) REFERENCES empleados (ID_Empleados)
);

CREATE TABLE recursos(
	ID_Recurso INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , Nombre_Recurso VARCHAR(30) NOT NULL
    , Descripcion VARCHAR(200) NULL
    , Cantidad INT NOT NULL,
    PRIMARY KEY (ID_Recurso),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento)
);

CREATE TABLE proveedores(
	ID_Proveedor INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Proveedor VARCHAR(30) NOT NULL
    , Contacto INT NOT NULL,
    PRIMARY KEY (ID_Proveedor)
);

CREATE TABLE proveedor_producto(
	ID_Producto_Prov INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Proveedor INT NOT NULL
    , Nombre_Producto VARCHAR(30) NOT NULL
    , Precio INT NOT NULL
    , Stock_Discponible INT NOT NULL,
    PRIMARY KEY (ID_Producto_Prov),
    FOREIGN KEY (ID_Proveedor) REFERENCES proveedores (ID_Proveedor)
);

CREATE TABLE patrocinador(
	ID_Patrocinador INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Patrocinador VARCHAR(30) NOT NULL
    , Contacto INT NOT NULL,
    PRIMARY KEY (ID_Patrocinador)
);

CREATE TABLE patrocinio(
	ID_Patrocinio INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Patrocinador INT NOT NULL
    , Monto INT NOT NULL
    , Condiciones VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_Patrocinio),
    FOREIGN KEY (ID_Patrocinador) REFERENCES patrocinador (ID_Patrocinador)
);

CREATE TABLE encuesta(
	ID_Encuesta INT NOT NULL UNIQUE AUTO_INCREMENT
    , Pregunta VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_Encuesta)
);

CREATE TABLE respuesta_encuesta(
	ID_Respuesta INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Encuesta INT NOT NULL
    , ID_Invitado INT NOT NULL
    , Puntuacion INT NULL,
    PRIMARY KEY (ID_Respuesta),
    FOREIGN KEY (ID_Encuesta) REFERENCES encuesta (ID_Encuesta),
    FOREIGN KEY (ID_Invitado) REFERENCES invitado (ID_Invitado)
);