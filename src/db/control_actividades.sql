DROP DATABASE IF EXISTS control_actividades;

CREATE DATABASE control_actividades;

USE control_actividades;

CREATE TABLE tipo_usuario(
	id 			TINYINT 	NOT NULL AUTO_INCREMENT,
    tipo 		VARCHAR(25) NOT NULL,
    descripcion VARCHAR(255),
    
    /*primary key*/
    PRIMARY KEY(id)
    
) ENGINE = INNODB;

CREATE table usuarios(
	id				SMALLINT 	NOT NULL AUTO_INCREMENT,
    nombres			VARCHAR(50) NOT NULL,
    apellidos		VARCHAR(50) NOT NULL,
    email			VARCHAR(50),
    username	    VARCHAR(50) not null,
    password 		VARCHAR(20)	NOT NULL,
    id_tipo_usuario	TINYINT 	NOT NULL,
    
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
   	fecha_creacion 		TIMESTAMP	    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fecha_entrega 		DATE 		    NOT NULL,
    id_usuario			SMALLINT 	    NOT NULL,
    id_proyecto			SMALLINT 	    NOT NULL,
    
    
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
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Grantham', 'McCrohon', 'gmccrohon0@state.gov', 'gmccrohon0', 'BtHnlS9JcghJ', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Lenore', 'Lacky', 'llacky1@instagram.com', 'llacky1', 'Ftt0qg', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Koenraad', 'Munt', 'kmunt2@indiegogo.com', 'kmunt2', 'jiGY6LqJl', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Bonnie', 'Albrecht', 'balbrecht3@naver.com', 'balbrecht3', 'Dp3C5e', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Calli', 'MacRannell', 'cmacrannell4@sakura.ne.jp', 'cmacrannell4', 'OrPNSDzcOH0', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Genni', 'Viner', 'gviner5@blogger.com', 'gviner5', 'ShypqO1z', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Hershel', 'Arundale', 'harundale6@amazon.co.jp', 'harundale6', 'gMobes2eJN', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Berny', 'Quadri', 'bquadri7@howstuffworks.com', 'bquadri7', 'h8WNBcj5', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Essie', 'Biggerdike', 'ebiggerdike8@soundcloud.com', 'ebiggerdike8', '6gYpJLrujL', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Reidar', 'Gready', 'rgready9@networksolutions.com', 'rgready9', 'CS2rhpcb', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Carlynne', 'Weetch', 'cweetcha@wordpress.org', 'cweetcha', 'OeWH8byaN', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Cristina', 'Ruxton', 'cruxtonb@hubpages.com', 'cruxtonb', 'XsAoxt1E', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Reinold', 'Ingerfield', 'ringerfieldc@cam.ac.uk', 'ringerfieldc', 'bnAB1cdC2', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Kathi', 'Dymock', 'kdymockd@nytimes.com', 'kdymockd', 'qwGR4I87', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Alleyn', 'Caisley', 'acaisleye@biblegateway.com', 'acaisleye', 'sFdGBbej038N', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Ashley', 'Prettjohn', 'aprettjohnf@blogspot.com', 'aprettjohnf', '2zoaAbSrw8Xc', 1);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Camile', 'Dick', 'cdickg@bloglovin.com', 'cdickg', 'uRTK09S', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Ally', 'Puddephatt', 'apuddephatth@infoseek.co.jp', 'apuddephatth', 'znJ7MCc4iY', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Baldwin', 'Dunseath', 'bdunseathi@jugem.jp', 'bdunseathi', 'ccZaEN', 2);
INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) VALUES ('Karilynn', 'Mac Giolla Pheadair', 'kmacgiollapheadairj@wsj.com', 'kmacgiollapheadairj', 'xKRalwi', 1);

/* proyectos */
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Daltfresh', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 13);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Gembucket', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Sonsing', 'Nulla mollis molestie lorem.', 10);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Cardguard', 'In hac habitasse platea dictumst.', 11);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Cardguard', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 11);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Tres-Zap', 'Integer ac leo. Pellentesque ultrices mattis odio.', 12);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Tresom', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 5);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Y-Solowarm', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 16);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Bamity', 'Proin eu mi.', 19);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Keylex', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 18);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Mat Lam Tam', 'Aliquam erat volutpat. In congue.', 19);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Namfix', 'Duis mattis egestas metus. Aenean fermentum.', 7);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Voltsillam', 'Quisque ut erat.', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Overhold', 'Etiam justo. Etiam pretium iaculis justo.', 8);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Regrant', 'Vivamus tortor. Duis mattis egestas metus.', 14);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Mat Lam Tam', 'Maecenas rhoncus aliquam lacus.', 1);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Latlux', 'Cras pellentesque volutpat dui.', 4);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Job', 'Aenean lectus.', 3);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Alpha', 'Nullam varius.', 3);
INSERT INTO proyectos (nombre_proyecto, descripcion, id_usuario) VALUES ('Alphazap', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 13);

/* proyectos_actividades */
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Quisque ut erat. Curabitur gravida nisi at nibh.', 5, 1, '2018/06/08', 19, 19);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 5, 0, '2017/07/20', 8, 14);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 4, 1, '2017/05/05', 6, 10);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 5, 0, '2017/07/08', 4, 5);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nulla mollis molestie lorem.', 1, 0, '2017/08/09', 18, 12);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 1, 1, '2018/08/04', 15, 14);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Duis bibendum. Morbi non quam nec dui luctus rutrum.', 2, 0, '2018/09/06', 16, 17);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Vivamus tortor.', 1, 0, '2017/04/18', 3, 12);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Integer a nibh. In quis justo.', 2, 1, '2017/08/02', 3, 5);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 2, 1, '2017/12/27', 3, 11);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, 0, '2018/07/04', 19, 18);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1, 0, '2018/03/15', 12, 20);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nulla tempus.', 3, 0, '2019/01/08', 2, 15);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 5, 0, '2019/03/19', 10, 15);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Nunc nisl.', 5, 1, '2017/07/25', 15, 18);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', 5, 1, '2019/01/12', 7, 4);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 5, 0, '2017/06/22', 18, 18);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Phasellus sit amet erat.', 5, 0, '2018/07/04', 13, 3);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 3, 0, '2018/01/13', 17, 9);
INSERT INTO proyectos_actividades (nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES ('Morbi non quam nec dui luctus rutrum.', 1, 0, '2017/06/25', 1, 7);
