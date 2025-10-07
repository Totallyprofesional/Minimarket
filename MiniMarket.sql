-- Generado por Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   en:        2025-10-06 17:10:33 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE afp ( 
     id_afp NUMBER(5) GENERATED ALWAYS AS IDENTITY
        (START WITH 210 INCREMENT BY 6) PRIMARY KEY,
     nom_afp VARCHAR2(255) NOT NULL
); 

ALTER TABLE afp ADD CONSTRAINT pk_afp PRIMARY KEY (id_afp);

INSERT INTO afp (id_afp, nom_afp)
VALUES (seq_empresa.NEXTVAL, 210, 'AFP Habitat');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 216, 'AFP Cuprum');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 222, 'AFP Provida');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 228, 'AFP PlanVital');
 
CREATE SEQUENCE salud_seq START WITH 2050 INCREMENT BY 10 NOCACHE NOCYCLE;

CREATE TABLE salud (
    id_salud  NUMBER(4) NOT NULL, 
    nom_salud VARCHAR2(40) NOT NULL
);

ALTER TABLE salud ADD CONSTRAINT salud_pk PRIMARY KEY ( id_salud ); 

ALTER TABLE salud RENAME TO prevision_salud;

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 2050, 'Fonasa');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 2060, 'Isapre Colmena');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 2070, 'Isapre Banmédica');

INSERT INTO prevision_salud (id_salud, nom_salud)
VALUES (seq_empresa.NEXTVAL, 2080, 'Isapre Cruz Blanca');

CREATE OR REPLACE TRIGGER trg_id_salud BEFORE INSERT ON salud FOR EACH ROW
BEGIN
    IF :NEW.id_salud IS NULL THEN
        SELECT salud_seq.NEXTVAL INTO :NEW.id_salud FROM dual;
    END IF;
END;
/

CREATE TABLE region (
    id_region  NUMBER(4) NOT NULL,
    nom_region VARCHAR2(255) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

INSERT INTO region (id_region, nom_region)
VALUES (seq_empresa.NEXTVAL, 1, 'Región Metropolitana')

INSERT INTO region (id_region, nom_region)
VALUES (seq_empresa.NEXTVAL, 2, 'Valparaíso')

INSERT INTO region (id_region, nom_region)
VALUES (seq_empresa.NEXTVAL, 2, 'Biobio') 

INSERT INTO region (id_region, nom_region)
VALUES (seq_empresa.NEXTVAL, 2, 'Los Lagos')

CREATE TABLE categoria (
    id_categoria     NUMBER(3) NOT NULL,
    nombre_categoria VARCHAR2(255) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE marca (
    id_marca     NUMBER(3) NOT NULL,
    nombre_marca VARCHAR2(25) NOT NULL 
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_marca );

ALTER TABLE marca ADD CONSTRAINT uq_nombre UNIQUE (nombre_marca);
 
CREATE TABLE medio_pago (
    id_pago     NUMBER(3) NOT NULL,
    nombre_pago VARCHAR2(60) NOT NULL 
);

ALTER TABLE medio_pago ADD CONSTRAINT medio_pago_pk PRIMARY KEY ( id_pago ); 

INSERT INTO medio_pago (id_pago, nombre_pago)
VALUES (seq_empresa.NEXTVAL, 11, 'Efectivo')

INSERT INTO medio_pago (id_pago, nombre_pago)
VALUES (seq_empresa.NEXTVAL, 12, 'Tarjeta Débito')

INSERT INTO medio_pago (id_pago, nombre_pago)
VALUES (seq_empresa.NEXTVAL, 13, 'Tarjeta Crédito')

INSERT INTO medio_pago (id_pago, nombre_pago)
VALUES (seq_empresa.NEXTVAL, 14, 'Cheque')

CREATE TABLE comuna (
    id_comuna        NUMBER(4) NOT NULL,
    nom_comuna       VARCHAR2(100) NOT NULL,
    region_id_region NUMBER(4) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE proveedor (
    id_proveedor     NUMBER(5) NOT NULL, 
    nombre_proveedor VARCHAR2(150) NOT NULL,
    rut_proveedor    VARCHAR2(10) NOT NULL,
    telefono         VARCHAR2(10) NOT NULL,
    email            VARCHAR2(200) NOT NULL,
    direccion        VARCHAR2(100) NOT NULL,
    comuna_id_comuna NUMBER(4) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

ALTER TABLE proveedor ADD CONSTRAINT uq_email UNIQUE (email);

CREATE SEQUENCE empleado_seq START WITH 750 INCREMENT BY 3 NOCACHE NOCYCLE; 

CREATE TABLE empleado (
    id_empleado          NUMBER(4) NOT NULL,
    rut_empleado         VARCHAR2(10) NOT NULL, 
    nombre_empleado      VARCHAR2(25) NOT NULL,
    apellido_paterno     VARCHAR2(25) NOT NULL,
    apellido_materno     VARCHAR2(25) NOT NULL,
    fecha_contratacion   DATE NOT NULL,
    sueldo_base          NUMBER(10) NOT NULL, 
    bono_jefatura        NUMBER(10),
    activo               CHAR(1) NOT NULL,
    tipo_empleado        VARCHAR2(25) NOT NULL,
    empleado_id_empleado NUMBER(4),
    afp_id_afp           NUMBER(5) NOT NULL,
    salud_id_salud       NUMBER(4) NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

ALTER TABLE empleado ADD CONSTRAINT chk_sueldo CHECK (sueldo_base > 400000);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 750, '11111111-1', 'Marcela', 'González', 'Pérez', 15-03-2022, 950000, 80000, 'S', 'Administrativo', (null), 2050, 210);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 753, '22222222-2', 'José', 'Muñoz', 'Ramírez', 10-07-2021, 900000, 75000, 'S', 'Administrativo', (null), 2060, 216);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 756, '33333333-3', 'Verónica', 'Soto', 'Alarcón', 05-01-2020, 880000, 70000, 'S', 'Vendedor', 750, 2060, 228);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 759, '44444444-4', 'Luis', 'Reyes', 'Fuentes', 01-04-2023, 560000, (null), 'S', 'Vendedor', 750, 2070, 228);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 762, '55555555-5', 'Claudia', 'Fernández', 'Lagos', 15-04-2023, 600000, (null), 'S', 'Vendedor', 753, 2070, 216);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 765, '66666666-6', 'Carlos', 'Navarro', 'Vega', 01-05-2023, 610000, (null), 'S', 'Administrativo', 753, 2060, 210);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 768, '77777777-7', 'Javiera', 'Pino', 'Rojas', 10-05-2023, 650000, (null), 'S', 'Administrativo', 750, 2050, 210);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 771, '88888888-8', 'Diego', 'Mella', 'Contreras', 12-05-2023, 620000, (null), 'S', 'Vendedor', 750, 2060, 216);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 774, '99999999-9', 'Fernanda', 'Salas', 'Herrera', 18-05-2023, 570000, (null), 'S', 'Vendedor', 753, 2070, 228);

INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido_paterno , apellido_materno, fecha_contratacion, sueldo_base, bono_jefatura, activo, tipo_empleado, empleado_id_empleado, afp_id_afp, salud_id_salud)
VALUES (seq_empresa.NEXTVAL, 777, '10101010-0', 'Tomás', 'Vidal', 'Espinoza', 01-06-2023, 530000, (null), 'S', 'Vendedor', (null), 2050, 222);

CREATE OR REPLACE TRIGGER trg_empleado BEFORE INSERT ON empleado FOR EACH ROW
BEGIN
    IF :NEW.id_empleado IS NULL THEN
        SELECT empleado_seq.NEXTVAL INTO :NEW.id_empleado FROM dual;
    END IF;
END;
/

CREATE TABLE producto (
    id_producto            NUMBER(4) NOT NULL,
    nombre_producto        VARCHAR2(100) NOT NULL, 
    precio_unitario        NUMBER NOT NULL,
    origen_nacional        CHAR(1) NOT NULL,
    stock_minimo           NUMBER(3) NOT NULL,
    activo                 CHAR(1) NOT NULL,
    proveedor_id_proveedor NUMBER(5) NOT NULL,
    categoria_id_categoria NUMBER(3) NOT NULL,
    marca_id_marca         NUMBER(3) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

ALTER TABLE producto ADD CONSTRAINT chk_stock CHECK (stock_minimo > 3);

CREATE TABLE venta (
    id_venta             GENERATED ALWAYS AS IDENTITY
        (START WITH 5050 INCREMENT BY 3) PRIMARY KEY,
    fecha_venta          DATE NOT NULL, 
    total_venta          NUMBER(10) NOT NULL,
    empleado_id_empleado NUMBER(4) NOT NULL,
    medio_pago_id_pago   NUMBER(3) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_venta );

INSERT INTO venta (id_venta, fecha_venta, total_venta, empleado_id_empleado, medio_pago_id_pago)
VALUES (seq_empresa.NEXTVAL, 5050, 12-05-2023, 225990, 12, 771);

INSERT INTO venta (id_venta, fecha_venta, total_venta, empleado_id_empleado, medio_pago_id_pago)
VALUES (seq_empresa.NEXTVAL, 5053, 23-10-2023, 534990, 13, 777);

INSERT INTO venta (id_venta, fecha_venta, total_venta, empleado_id_empleado, medio_pago_id_pago)
VALUES (seq_empresa.NEXTVAL, 5056, 17-02-2023, 466990, 11, 759);

CREATE TABLE detalle_venta (
    cod_venta            NUMBER(4) NOT NULL,
    cod_producto         NUMBER(4) NOT NULL,
    cantidad             NUMBER(6) NOT NULL,
    CONSTRAINT pk_detalle_venta PRIMARY KEY (cod_venta, cod_producto),
    CONSTRAINT fk_detalle_venta_venta FOREIGN KEY (cod_venta)
        REFERENCES venta(id_venta),
    CONSTRAINT fk_detalle_venta_producto FOREIGN KEY (cod_producto)
        REFERENCES producto(id_producto)

ALTER TABLE detalle_venta ADD CONSTRAINT detalle_venta_pk PRIMARY KEY ( cod_venta,
                                                                        cod_producto );
                                                                        
ALTER TABLE detalle_venta ADD CONSTRAINT chk_cantidad CHECK (cantidad >= 1);         
   
CREATE TABLE administrativo ( 
    id_empleado NUMBER(4) NOT NULL,  
    CONSTRAINT pk_administrativo PRIMARY KEY (id_empleado), 
    CONSTRAINT fk_administrativo_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado)

ALTER TABLE administrativo ADD CONSTRAINT administrativo_pk PRIMARY KEY ( id_empleado );

CREATE TABLE vendedor (
    id_empleado          NUMBER(4) NOT NULL,
    comision_venta       NUMBER(5, 2) NOT NULL,
    CONSTRAINT pk_vendedor PRIMARY KEY (id_empleado), 
    CONSTRAINT fk_vendedor_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado),
);

ALTER TABLE vendedor ADD CONSTRAINT vendedor_pk PRIMARY KEY ( id_empleado );

ALTER TABLE vendedor ADD CONSTRAINT chk_comision CHECK (comision_venta BETWEEN 0 AND 0.25);

ALTER TABLE administrativo
    ADD CONSTRAINT administrativo_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( region_id_region )
        REFERENCES region ( id_region );

ALTER TABLE detalle_venta
    ADD CONSTRAINT detalle_venta_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE detalle_venta
    ADD CONSTRAINT detalle_venta_venta_fk FOREIGN KEY ( venta_id_venta )
        REFERENCES venta ( id_venta );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_afp_fk FOREIGN KEY ( afp_id_afp )
        REFERENCES afp ( id_afp );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_salud_fk FOREIGN KEY ( salud_id_salud )
        REFERENCES salud ( id_salud );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE producto
    ADD CONSTRAINT producto_marca_fk FOREIGN KEY ( marca_id_marca )
        REFERENCES marca ( id_marca );

ALTER TABLE producto
    ADD CONSTRAINT producto_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_comuna_fk FOREIGN KEY ( comuna_id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE vendedor
    ADD CONSTRAINT vendedor_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE venta
    ADD CONSTRAINT venta_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE venta
    ADD CONSTRAINT venta_medio_pago_fk FOREIGN KEY ( medio_pago_id_pago )
        REFERENCES medio_pago ( id_pago );
        
SELECT  
    id_empleado AS identificador,
    nombre_empleado || ' ' || apellido_paterno || ' ' || apellido_materno AS nombre_completo,
    sueldo_base AS salario,
    bono_jefatura AS bonifcacion,
    sueldo_base + bono_jefatura AS salario_simulado
FROM empleado
WHERE activo = 'S'
  AND bono_jefatura IS NOT NULL
ORDER BY salario_simulado DESC, apellido_paterno DESC; 

SELECT
    nombre_empleado || ' ' || apellido_paterno || ' ' || apellido_materno AS empleado,
    sueldo_base AS sueldo,
    sueldo_base * 0.08 AS posible_aumento,
    sueldo_base + (sueldo_base * 0.08) AS sueldo_simulado
FROM empleado  
WHERE sueldo_base >= 550000
  AND sueldo_base <= 800000
ORDER BY sueldo_base ASC;

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             28
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
