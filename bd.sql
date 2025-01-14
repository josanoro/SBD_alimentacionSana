
CREATE TABLE USUARIO(
ID_USUARIO INT(5) NOT NULL,
CORREO CHAR(40) NOT NULL,
NOMBRE CHAR(20) NOT NULL,
APELLIDO CHAR(20) NOT NULL,
CONTRASENA CHAR(30) NOT NULL,
PESO FLOAT NOT NULL,
ESTATURA FLOAT NOT NULL,
FECHA_NACIMIENTO DATE,
ENFERMEDADES CHAR(20),
IMC FLOAT, 
PRIMARY KEY (ID_USUARIO)
);

CREATE TABLE TABLERO_SEMANAL(
ID_TABLERO INT(5) NOT NULL,
FECHA_INICIO DATE NOT NULL,
FECHA_FIN DATE NOT NULL,
FRANJA_HORARIA CHAR(15) NOT NULL,
ID_USUARIO INT(5) NOT NULL,
PRIMARY KEY(ID_TABLERO),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE RECETA (
ID_RECETA INT(5),
DESCRIPCION CHAR(40),
INFORMACION_NUTRICIONAL CHAR(40),
RATE INT(5),
FECHA_AGREGACION DATE,
ID_USUARIO INT(5) NOT NULL,
PRIMARY KEY (ID_RECETA),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE INGREDIENTE(
ID_INGREDIENTE INT(5) NOT NULL, 
GRUPO_ALIMENTICIO CHAR(15) NOT NULL,
CANTIDAD INT(3) NOT NULL,
CALORIAS FLOAT NOT NULL,
ID_RECETA INT(5),
PRIMARY KEY(ID_INGREDIENTE),
FOREIGN KEY(ID_RECETA) REFERENCES RECETA(ID_RECETA)
);

CREATE TABLE RESUMEN_SEMANAL(
NUMERO_RESUMEN INT(5) NOT NULL,
CALORIAS_CONSUMIDAS_KCAL FLOAT NOT NULL,
CALORIAS_REDUCIDAS_KCAL FLOAT NOT NULL,
ID_USUARIO INT(5) NOT NULL,
PRIMARY KEY(NUMERO_RESUMEN),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE META(
ID_META INT(5) NOT NULL,
META_CUMPLIDA BOOL NOT NULL,
FECHA_INICIO_M DATE NOT NULL,
FECHA_FIN_M DATE NOT NULL,
NUMERO_RESUMEN INT(5) NOT NULL,
PRIMARY KEY(ID_META),
FOREIGN KEY(NUMERO_RESUMEN) REFERENCES RESUMEN_SEMANAL(NUMERO_RESUMEN)
);

CREATE TABLE MENSAJE
(ID_MENSAJE INTEGER NOT NULL,
 MENSAJE_MOTIVACIONAL CHAR(25) NOT NULL,
 MENSAJE_FELICITACION CHAR(25) NOT NULL,
 ID_META INTEGER NOT NULL,
 PRIMARY KEY(ID_MENSAJE),
 FOREIGN KEY (ID_META) REFERENCES META(ID_META));