DROP DATABASE IF EXISTS control_actividades;

CREATE DATABASE control_actividades;

USE control_actividades;

CREATE TABLE tipo_usuario(
	id 			        TINYINT 	    NOT NULL AUTO_INCREMENT,
    tipo 		        VARCHAR(25)     NOT NULL,
    descripcion         VARCHAR(255),
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id)
    
) ENGINE = INNODB;

CREATE table usuarios(
	id				    SMALLINT 	    NOT NULL AUTO_INCREMENT,
    nombres			    VARCHAR(50)     NOT NULL,
    apellidos		    VARCHAR(50)     NOT NULL,
    email			    VARCHAR(50),
    username	        VARCHAR(50)     NOT NULL,
    password 		    VARCHAR(20)	    NOT NULL,
    id_tipo_usuario	    TINYINT 	    NOT NULL,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id,id_tipo_usuario),
    
    /*foreign key*/
    INDEX(id_tipo_usuario),
    FOREIGN KEY(id_tipo_usuario) REFERENCES tipo_usuario(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB;

CREATE TABLE proyectos(
	id 					SMALLINT	    NOT NULL AUTO_INCREMENT,
    nombre_proyecto		VARCHAR(100)	NOT NULL,
    descripcion         VARCHAR(255)    NOT NULL,
    id_usuario			SMALLINT 	    NOT NULL,
    creado 		        TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP,
    modificado          TIMESTAMP       ON UPDATE CURRENT_TIMESTAMP,
    
    /*primary key*/
    PRIMARY KEY(id, id_usuario),
    
    /*foreign key*/
    INDEX(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = INNODB;

CREATE TABLE proyectos_actividades(
	id 					SMALLINT 	    NOT NULL AUTO_INCREMENT,
    nombre_actividad	VARCHAR(255)    NOT NULL,
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
    
) ENGINE = INNODB;

/* Datos */

/* tipo_usuario */
INSERT INTO tipo_usuario (tipo, descripcion) VALUES("administrador", "usuario con la capacidad de crear, eliminar, acualizar y asignar proyectos y actividades");
INSERT INTO tipo_usuario (tipo, descripcion) VALUES("normal", "usuario solo con la capacidad de visualizar actividades");

/* usuarios */
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Kathi', 'Dymock', 'kdymockd@nytimes.com', 'kdymockd', 'qwGR4I87', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Alleyn', 'Caisley', 'acaisleye@biblegateway.com', 'acaisleye', 'sFdGBbej038N', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Ashley', 'Prettjohn', 'aprettjohnf@blogspot.com', 'aprettjohnf', '2zoaAbSrw8Xc', 1);

/* proyectos */
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Keylex', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Latlux', 'Cras pellentesque volutpat dui.', 2);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Alpha', 'Nullam varius.', 3);

/* proyectos_actividades */
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nunc purus.', 4, 1, '2019-05-18', 1, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Quisque ut erat.', 1, 1, '2019-06-07', 3, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Integer a nibh.', 5, 1, '2019-05-26', 3, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('In est risus, auctor sed, tristique in, tempus sit amet, sem.', 5, 1, '2019-05-11', 2, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 2, 0, '2019-05-08', 1, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('In sagittis dui vel nisl.', 1, 0, '2019-05-05', 1, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Aenean fermentum.', 2, 0, '2019-06-05', 1, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Vestibulum ac est lacinia nisi venenatis tristique.', 3, 0, '2019-05-11', 2, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Suspendisse ornare consequat lectus.', 4, 0, '2019-05-23', 2, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Donec vitae nisi.', 1, 1, '2019-06-28', 2, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Integer non velit.', 5, 0, '2019-06-02', 3, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Duis bibendum.', 1, 0, '2019-06-13', 3, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Proin at turpis a pede posuere nonummy.', 5, 0, '2019-04-23', 3, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Vivamus vestibulum sagittis sapien.', 1, 0, '2019-06-03', 1, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Sed sagittis.', 5, 1, '2019-06-15', 1, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Vivamus vel nulla eget eros elementum pellentesque.', 3, 0, '2019-05-26', 2, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Proin risus.', 1, 1, '2019-06-26', 1, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 1, '2019-06-10', 2, 1);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nullam molestie nibh in lectus.', 4, 1, '2019-06-05', 3, 2);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Praesent blandit.', 4, 0, '2019-05-06', 1, 1);
