DROP DATABASE IF EXISTS control_actividades;

CREATE DATABASE control_actividades;

USE control_actividades;

CREATE TABLE tipo_usuario(
	id 			TINYINT 	NOT NULL AUTO_INCREMENT,
    tipo 		VARCHAR(12) NOT NULL,
    descripcion VARCHAR(255),
    
    /*primary key*/
    PRIMARY KEY(id)
    
) ENGINE = INNODB;

CREATE table usuarios(
	id				SMALLINT 	NOT NULL AUTO_INCREMENT,
    nombres			VARCHAR(50) NOT NULL,
    apellidos		VARCHAR(50) NOT NULL,
    email			VARCHAR(50),
    nombre_usuario	VARCHAR(50) not null,
    tipo_usuario	VARCHAR(50) NOT NULL,
    pass 			VARCHAR(20)	NOT NULL,
    id_tipo_usuario	TINYINT 	NOT NULL,
    
    /*primary key*/
    PRIMARY KEY(id,id_tipo_usuario),
    
    /*foreign key*/
    INDEX(id_tipo_usuario),
    FOREIGN KEY(id_tipo_usuario) REFERENCES tipo_usuario(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB;

CREATE TABLE proyectos(
	id 					SMALLINT	    NOT NULL AUTO_INCREMENT,
    nombre_proyecto		VARCHAR(50)	    NOT NULL,
    descripcion         VARCHAR(255)    NOT NULL,
    id_usuario			SMALLINT 	    NOT NULL,			
    
    /*primary key*/
    PRIMARY KEY(id, id_usuario),
    
    /*foreign key*/
    INDEX(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB;

CREATE TABLE proyectos_actividades(
	id 					SMALLINT 	NOT NULL AUTO_INCREMENT,
    nombre_actividad	VARCHAR(50)	NOT NULL,
    prioridad 			TINYINT 	NOT NULL,
    estado 				TINYINT 	NOT NULL,
   	fecha_creacion 		TIMESTAMP	DEFAULT CURRENT_TIMESTAMP,
    fecha_entrega 		DATE 		NOT NULL,
    id_usuario			SMALLINT 	NOT NULL,
    id_proyecto			SMALLINT 	NOT NULL,
    
    
    /*primary key*/
    PRIMARY KEY(id),
    
     /*foreign key*/
    INDEX(id_usuario, id_proyecto),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_proyecto) REFERENCES proyectos(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB;