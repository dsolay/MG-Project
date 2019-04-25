DROP DATABASE IF EXISTS control_actividades;

CREATE DATABASE control_actividades;

USE control_actividades;

CREATE TABLE tipo_usuario(
	id 			        TINYINT 	    NOT NULL AUTO_INCREMENT,
    tipo 		        VARCHAR(25)     CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    descripcion         VARCHAR(255)    CHARSET utf8 COLLATE utf8_spanish_ci,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id)
    
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE table usuarios(
	id				    SMALLINT 	    NOT NULL AUTO_INCREMENT,
    nombres			    VARCHAR(50)     CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    apellidos		    VARCHAR(50)     CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    email			    VARCHAR(50)     CHARSET utf8 COLLATE utf8_spanish_ci,
    username	        VARCHAR(50)     CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    password 		    VARCHAR(20)	    CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    id_tipo_usuario	    TINYINT 	    NOT NULL,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id,id_tipo_usuario),
    
    /*foreign key*/
    INDEX(id_tipo_usuario),
    FOREIGN KEY(id_tipo_usuario) REFERENCES tipo_usuario(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE proyectos(
	id 					SMALLINT	    NOT NULL AUTO_INCREMENT,
    nombre_proyecto		VARCHAR(100)	CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    descripcion         VARCHAR(255)    CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    id_usuario			SMALLINT 	    NOT NULL,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id, id_usuario),
    
    /*foreign key*/
    INDEX(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE proyectos_actividades(
	id 					SMALLINT 	    NOT NULL AUTO_INCREMENT,
    nombre_actividad	VARCHAR(255)    CHARSET utf8 COLLATE utf8_spanish_ci NOT NULL,
    prioridad 			TINYINT 	    NOT NULL,
    estado 				TINYINT 	    NOT NULL,
    fecha_entrega 		DATE 		    NOT NULL,
    id_usuario			SMALLINT 	    NOT NULL,
    id_proyecto			SMALLINT 	    NOT NULL,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    
    /*primary key*/
    PRIMARY KEY(id),
    
     /*foreign key*/
    INDEX(id_usuario, id_proyecto),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_proyecto) REFERENCES proyectos(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/* Datos */

/* tipo_usuario */
INSERT INTO tipo_usuario (tipo, descripcion) VALUES('administrador', 'usuario con la capacidad de crear, eliminar, acualizar y asignar proyectos y actividades');
INSERT INTO tipo_usuario (tipo, descripcion) VALUES('normal', 'usuario solo con la capacidad de visualizar actividades');

/* usuarios */
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Roman', 'Gonzalez', 'roman.gonzalez@proyectosfgk.org', 'solay2516', 'abcd1234', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Antonio', 'Juarez', 'antonio.rodriguez@proyectosfgk.org', 'acaisleye', 'sFdGBbej038N', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Wendy', 'Medina', 'aprettjohnf@blogspot.com', 'aprettjohnf', '2zoaAbSrw8Xc', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Cristian', 'Otoniel', 'aprettjohnf@blogspot.com', 'aprettjohnf', '2zoaAbSrw8Xc', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Anderson', 'Otoniel', 'aprettjohnf@blogspot.com', 'aprettjohnf', '2zoaAbSrw8Xc', 1);

/* proyectos */
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Keylex', 'Sistema de manejo de inventarios', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Bootstrap', 'Framework CSS, HTML y JS para diseño web responsivo.', 2);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('DevelopSY', 'Entorno de desarrollo web con docker', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('MailSY', 'Servidor de mensajeria basado en el protocolo XMPP', 1);

/* proyectos_actividades */
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Hacer vista de existencias.', 4, 1, '2019-05-18', 1, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Programar metodo para salidas y entradas de inventarios.', 1, 1, '2019-06-07', 2, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Diseño de la base datos.', 5, 1, '2019-05-26', 3, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Hacer pruebas unitarias.', 5, 1, '2019-05-11', 4, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Realizar diseño de grilla.', 2, 1, '2019-05-08', 1, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Realizar diseño de barra de navegacion.', 1, 1, '2019-05-05', 2, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Escoger paleta de colores.', 2, 1, '2019-06-05', 3, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Realizar diseño de formularios.', 3, 1, '2019-05-11', 4, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Configura contenedor con servidor de base de datos.', 4, 1, '2019-05-23', 1, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('configurar contenedor con intefez web para administracion.', 1, 1, '2019-06-28', 2, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Configurar contenedor con php.', 5, 1, '2019-06-02', 3, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Integrar contendores en un archivo docker-compose.yml.', 1, 1, '2019-06-13', 4, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('configurar base de datos.', 5, 1, '2019-04-23', 1, 4);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Configurar modulo para intercambio de archivos.', 1, 1, '2019-06-03', 2, 4);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Configurar servidor proxy.', 5, 1, '2019-06-15', 3, 4);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Configurar modulo para compartir estados.', 3, 1, '2019-05-26', 4, 4);