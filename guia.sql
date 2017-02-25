SET SERVEROUTPUT ON;

--CREACION DE LA TABLA 
CREATE TABLE DIRECCION(ID_DIRECCION INTEGER, NOMB_DIR VARCHAR2(50),CONSTRAINT PK_ID_DIRECCION PRIMARY KEY);

--CREACION DE LA TABLA USUARIO
CREATE TABLE USUARIO(ID_USUARIO INTEGER, NOMBRE VARCHAR2(40), EMAIL VARCHAR2(20), LOGIN VARCHAR2(10), PASS VARCHAR2(10),ID_DIRECCION VARCHAR2(50) 
CONSTRAINT PK_ID_USUARIO PRIMARY KEY(ID_USUARIO), CONSTRAINT FK1_ID_DIRECCION FOREIGN KEY(ID_DIRECCION) REFERENCES DIRECCION);

--CREACION DE LA TABLA HOBBIES
CREATE TABLE HOBBIES(ID_HOBBIES INTEGER, NOM_HOBBIES VARCHAR2(20), ID_USUARIO INTEGER, CONSTRAINT PK_ID_HOBBIES PRIMARY KEY, 
CONSTRAINT FK2_ID_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO);

--CREACION DE LA SECUENCIA USUARIO
CREATE SEQUENCE SEC_USUARIO
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--CREACION DE LA SECUENCIA DIRECCION
CREATE SEQUENCE SEC_DIRECCION
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--CREACION DE LA SECUENCIA HOBBIES
CREATE SEQUENCE SEC_HOBBIES
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


--CREACION DE PROCEDIMIENTOS PARA ALMACENAR USUARIO
CREATE OR REPLACE PROCEDURE GUARDAR_USUARIO(MY_ID_USUARIO IN INTEGER, MY_NOMBRE IN VARCHAR2, MY_EMAIL IN VARCHAR2, 
MY_LOGIN IN INTEGER, MY_PASS VARCHAR2, MY_ID_DIRECCION IN VARCHAR2);
AS
BEGIN
SELECT SEC_USUARIO.NEXTVAL INTO MY_ID_USUARIO FROM DUAL;
INSERT INTO USUARIO VALUES(MY_ID_USUARIO, MY_NOMBRE, MY_EMAIL, MY_LOGIN, MY_PASS, MY_DIRECCION);
END;
/

--CREACION DE PROCEDIMENTOS PARA ALMACENAR DIRECCION
CREATE OR REPLACE PROCEDURE GUARDAR_DIRECCION(MY_ID_DIRECCION IN INTEGER, MY_NOMB_DIR IN VARCHAR2);
AS
BEGIN
SELECT SEC_DIRECCION.NEXTVAL INTO MY_ID_DIRECCION FROM DUAL;
INSERT INTO DIRECCION VALUES(MY_ID_DIRECCION, MY_NOMB_DIR);
END;
/

--CREACION DE PROCEDIMIENTOS PARA ALMACENAR HOBBIES
CREATE OR REPLACE PROCEDURE GUARDAR_HOBBIES(MY_ID_HOBBIES IN INTEGER, NOB_HOBBIES IN VARCHAR2, MY_ID_USUARIO IN INTEGER);
AS
BEGIN
SELECT SEC_HOBBIES.NEXTVAL INTO MY_ID_HOBBIES FROM DUAL;
INSERT INTO HOBBIES VALUES(MY_ID_HOBBIES, MY_NOMB_HOBBIES, MY_ID_USUARIO);
END;
/
