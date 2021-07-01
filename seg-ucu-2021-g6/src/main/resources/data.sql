DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
  username VARCHAR(50) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  fnac DATE NOT NULL,
  salt VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  fbaja TIMESTAMP,
  fcrea TIMESTAMP NOT NULL,
  factivacion TIMESTAMP,
  uuidactivacion VARCHAR(250) ,
  uact VARCHAR(50) NOT NULL,
  fact TIMESTAMP NOT NULL
);

INSERT INTO usuario (username, nombre, email, fnac, salt, password, fbaja, uact, fact, fcrea, factivacion) VALUES
  ('admin', 'Administrator', 'admin@cervezero.com', PARSEDATETIME('10/04/1986','dd/MM/yyyy','en'),'l1aFNs33xy4IWm7gadZlOw==', '+lvVHIO6sIVbSTWCtgGlXg==', NULL, 'admin', now(), now(), now()),
  ('notadmin', 'Not Administrator', 'notadmin@cervezero.com', PARSEDATETIME('10/04/1986','dd/MM/yyyy','en'), 'l1aFNs33xy4IWm7gadZlOw==', '+lvVHIO6sIVbSTWCtgGlXg==', NULL, 'admin', now(), now(), now());

DROP TABLE IF EXISTS rol;

CREATE TABLE rol (
  rolname VARCHAR(50) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fbaja TIMESTAMP,
  uact VARCHAR(50) NOT NULL,
  fact TIMESTAMP NOT NULL
);

INSERT INTO rol (rolname, nombre, fbaja, uact, fact) VALUES
  ('ROLE_ADMIN', 'Rol Administrator', NULL, 'admin', now()),
  ('ROLE_SELF_REGISTER', 'Rol Self Register', NULL, 'admin', now())
  ;

DROP TABLE IF EXISTS asignacion_usuario;

CREATE TABLE asignacion_usuario (
  asigusuid INT AUTO_INCREMENT  PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  rolname VARCHAR(50) NOT NULL,
  fbaja TIMESTAMP,
  uact VARCHAR(50) NOT NULL,
  fact TIMESTAMP NOT NULL,
  foreign key (username) references usuario(username),
  foreign key (rolname) references rol(rolname)
);

INSERT INTO asignacion_usuario (username, rolname, fbaja, uact, fact) VALUES
  ('admin', 'ROLE_ADMIN', NULL, 'admin', now()),
  ('notadmin', 'ROLE_SELF_REGISTER', NULL, 'admin', now());

DROP TABLE IF EXISTS sesion;

CREATE TABLE sesion (
  uuid VARCHAR(250) PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  roles VARCHAR(50) NOT NULL,
  fcrea TIMESTAMP NOT NULL,
  flastaccess TIMESTAMP NOT NULL
);
