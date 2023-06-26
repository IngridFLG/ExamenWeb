CREATE DATABASE `laboratoriosql` /*!40100 DEFAULT CHARACTER SET latin1 */;

-- laboratoriosql.acceso definition

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- laboratoriosql.consulta definition

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproblema` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `explicacion` text DEFAULT NULL,
  `solucion` text DEFAULT NULL,
  `explicsolucion` text DEFAULT NULL,
  `solucionalternativa` text DEFAULT NULL,
  `numpracticas` int(11) DEFAULT NULL COMMENT 'Define el numero de veces que se puede hacer practicas de la consulta antes de ejecutarla finalmente',
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IXFK_consulta_problema` (`idproblema`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.examen definition

CREATE TABLE `examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fechainicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `fechafin` timestamp NOT NULL DEFAULT current_timestamp(),
  `problema` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examen_problema_fk` (`problema`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.finalsql definition

CREATE TABLE `finalsql` (
  `usuario` varchar(20) DEFAULT NULL,
  `idconsulta` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssql` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `resultado` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IXFK_final_consulta` (`idconsulta`) USING BTREE,
  KEY `IXFK_final_usuario` (`usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.opcion definition

CREATE TABLE `opcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` int(11) NOT NULL,
  `examen` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opcion_consulta_fk` (`consulta`) USING BTREE,
  KEY `opcion_examen_fk` (`examen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.practica definition

CREATE TABLE `practica` (
  `usuario` int(11) DEFAULT NULL,
  `idconsulta` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssql` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `resultado` text DEFAULT NULL,
  `estado` int(1) DEFAULT 0,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IXFK_practica_consulta` (`idconsulta`) USING BTREE,
  KEY `IXFK_practica_usuario` (`usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.problema definition

CREATE TABLE `problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `docente` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `nombrebase` varchar(50) DEFAULT NULL COMMENT 'Almacena el nombre en la base de datos de MySQL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.rol definition

CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- laboratoriosql.tabla definition

CREATE TABLE `tabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `idproblema` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IXFK_tabla_problema` (`idproblema`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la información de las tablas, el diccionario de datos de información de las mismas';


-- laboratoriosql.usuario definition

CREATE TABLE `usuario` (
  `usuario` varchar(20) NOT NULL COMMENT 'Guarda información del usuario con el cual accede al sistema',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Almacena información del nombre del usuario',
  `clave` varchar(100) DEFAULT NULL COMMENT 'Almacena la clave del usuario',
  `email` varchar(100) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Almacena información de los usuarios que pueden utilizar el sistema';


-- laboratoriosql.usuariorol definition

CREATE TABLE `usuariorol` (
  `rol` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`rol`,`usuario`),
  KEY `IXFK_usuariorol_rol` (`rol`) USING BTREE,
  KEY `IXFK_usuariorol_usuario` (`usuario`) USING BTREE,
  CONSTRAINT `usuariorol_FK` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuariorol_FK_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO laboratoriosqlsql.usuario
(usuario, nombre, clave, email, id, estado)
VALUES('crangarita', 'Carlos René Angarita Sanguino', '$2a$10$e24FNldaYBl7DMCCbiUoReyANnRAPLYaQZdhcS6/tZZmavOVM8gY.', 'crangarita@gmail.com', 1, 'A');

INSERT INTO laboratoriosql.problema
(id, nombre, descripcion, docente, estado, nombrebase)
VALUES(1, 'Envío de Mensajes', 'Base de datos para el almacenamiento del envío masivo de mensajes utilizando una modalidad tipo mailcheap.  El sistema permite registrar contactos, campañas, envíos de mensajes y demás.', 'Carlos Rene Angarita Sanguino', 1, 'mensaje');
INSERT INTO laboratoriosql.problema
(id, nombre, descripcion, docente, estado, nombrebase)
VALUES(3, 'Sistema de Liquidación de Nómina', 'Base de datos para la liquidación de la nómina de una empresa.', 'Carlos Rene Angarita Sanguino', 0, 'nomina');
INSERT INTO laboratoriosql.problema
(id, nombre, descripcion, docente, estado, nombrebase)
VALUES(6, 'Semilleros de Investigación', 'Base de datos para la gestión de los semilleros de investigación de la Universidad.  Todos los semilleros tienen un conjunto de integrantes que pueden ser docente o estudiantes.  Con el pasar del tiempo los participantes hacen parte del semillero como integrantes en los distintos roles, que son definidos por los semilleros.', 'Carlos Rene Angarita Sanguino', 1, 'semillero');

INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(1, 1, 'Listado de usuarios con su identificador, email y clave', 'Se deben proyectar de la tabla usuario los campos usuario, nombre y email', 'select usuario, nombre, email from usuario2', NULL, NULL, 0, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(19, 1, 'Seleccione el listado de roles del sistema ', 'Se debe realizar la proyección del campo descripcion de la tabla rol ', 'select descripcion from rol', NULL, NULL, 5, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(42, 1, 'Listado de contactos que han recibido al menos un mensaje', '', 'select distinct c.nombre, c.apellido, c.email from contacto c join mensaje m on m.contacto = c.id', NULL, NULL, 5, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(43, 1, 'Cantidad de mensajes abiertos por fecha', '', 'SELECT fechaapertura, count(id) FROM mensaje group by fechaapertura', NULL, NULL, 0, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(44, 1, 'Listado de contactos que han recibido mensajes de campañas de usuarios que los registraron', '', 'SELECT m.fechaenvio, co.email, c.nombre  FROM mensaje m join campana c on c.id = m.campana join usuario u on u.usuario = c.usuario join contacto co on co.usuario = u.usuario where co.id = m.contacto', NULL, NULL, 10, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(5, 6, 'El menor participante de todos los estudiantes del semillero VIRAL', 'Se recorren las tablas tipo, participante, integrante, rol y semillero para obtener los nombres de los estudiantes con el rol dentro de un semillero.', 'select documento, participante.nombre from semillero join rol on rol.semillero = semillero.id join integrante on integrante.rol = rol.id join participante on participante.id = integrante.participante join tipo on  tipo.id = participante.tipo
where semillero.nombre like ''%VIRAL%'' and participante.fechanacimiento = (select min(participante.fechanacimiento) from semillero join rol on rol.semillero = semillero.id join integrante on integrante.rol = rol.id join participante on participante.id = integrante.participante join tipo on  tipo.id = participante.tipo where semillero.nombre like ''%VIRAL%'')', NULL, NULL, 5, 0);
INSERT INTO laboratoriosql.consulta
(id, idproblema, descripcion, explicacion, solucion, explicsolucion, solucionalternativa, numpracticas, estado)
VALUES(6, 6, 'Listado de estudiantes de un semillero que nunca han participado en un proyecto del semillero.', 'saco el nombre de la tabla participante, recorro las tablas participante,tipo para sacar el tipo estudiante después las tablas semillero,rol,integrante para tener una condición donde los participantes sean los mismos que los integrantes después son las tablas proyecto, proyectoparticipante donde hago una subconsulta para sacar los participantes que están en un proyecto y les hago un not in con integrantes para que solo me muestres los que no están participando', 'select p.nombre
from proyecto p join proyectoparticipante pp on pp.proyecto = p.id
group by p.nombre
having count(pp.participante) = (
select max(s.cantidad) from (select pp.proyecto, count(pp.participante) cantidad
                         	from proyectoparticipante pp group by pp.proyecto) s)', NULL, NULL, 5, 1);

INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(1, 'campana', 'Contiene la información de la campaña que se crea para el envío de los mensajes', 1);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(2, 'contacto', 'Contiene la información del contacto de las personas de cada usuario en el sistema', 1);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(3, 'mensaje', 'Contiene la información del envío y programación de los mensajes', 1);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(4, 'rol', 'Contiene la información de los distintos roles o funcionalidades del sistema', 1);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(5, 'usuario', 'Contiene la información del usuario que permite entre algunas cosas la validación de sesión y demas', 1);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(6, 'usuariorol', 'Contiene la información de la privilegios que tiene cada usuario', 1);

INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(47, 'actividad', 'Corresponde a las actividades que realiza el semillero', 6);
INSERT INTO laboratoriosql.tabla
(id, nombre, descripcion, idproblema)
VALUES(48, 'carrera', '', 6);

