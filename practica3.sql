set serveroutput on;

--Generamos la secuencia

CREATE SEQUENCE SEC_PERSONA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;
--Generamos la tabla

CREATE TABLE PERSONA(ID_PERSONA INTEGER, NOMBRE VARCHAR2(20),EDAD INTEGER,
CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));

create or replace procedure guardar_persona(my_id OUT integer, my_nombre IN 
varchar2, my_edad IN integer)
AS
Begin
select sec_persona.nextval INTO my_id from DUAL; INSERT into persona values
(my_id, my_nombre , my_edad);
END;
/

declare 
valor integer;
begin
guardar_persona(valor, 'Mauricio',23);
end;
/

select * from persona;
