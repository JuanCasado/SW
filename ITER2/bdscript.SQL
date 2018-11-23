/*
Created: 20/11/18
Modified: 23/11/18
Model: Logical model
Database: PostgreSQL 10
*/


-- Create functions section -------------------------------------------------

CREATE FUNCTION "Inheritance_Coordinador técnico"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Ayudante técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Responsable del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Responsable del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Técnico informático
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Técnico informático. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Ayudante técnico"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Coordinador técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Coordinador técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Responsable del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Responsable del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Técnico informático
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Técnico informático. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Responsable del almacén"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Coordinador técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Coordinador técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Técnico informático
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Técnico informático. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Ayudante del almacén"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Coordinador técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Coordinador técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Responsable del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Responsable del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Técnico informático
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Técnico informático. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Técnico informático"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Coordinador técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Coordinador técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante técnico
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante técnico. Cannot insert.';
  end if;
  select count(*) into numrows
  from Responsable del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Responsable del almacén. Cannot insert.';
  end if;
  select count(*) into numrows
  from Ayudante del almacén
  where DNI = new.DNI;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Ayudante del almacén. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Pieza especial"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Pieza básica
  where ID = new.ID;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Pieza básica. Cannot insert.';
  end if;
return new;
end;
$$
;

CREATE FUNCTION "Inheritance_Pieza básica"()
RETURNS trigger
 LANGUAGE 'plpgsql'
 VOLATILE
AS
$$
declare numrows integer;
begin
  select count(*) into numrows
  from Pieza especial
  where ID = new.ID;
  if (numrows > 0) then
    raise exception 'Exclusive Inheritance violation with table Pieza especial. Cannot insert.';
  end if;
return new;
end;
$$
;

-- Create tables section -------------------------------------------------

-- Table Cliente

CREATE TABLE "Cliente"(
 "DNI/CIF" Character(10) NOT NULL,
 "Particular" Boolean NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "Dirección" Text NOT NULL,
 "email" Text NOT NULL
)
;

-- Add keys for table Cliente

ALTER TABLE "Cliente" ADD CONSTRAINT "DNI/CIF" PRIMARY KEY ("DNI/CIF")
;

ALTER TABLE "Cliente" ADD CONSTRAINT "email" UNIQUE ("email")
;

ALTER TABLE "Cliente" ADD CONSTRAINT "Teléfono" UNIQUE ("Teléfono")
;

-- Table Peticion de trabajo

CREATE TABLE "Peticion de trabajo"(
 "Fecha" Timestamp(6) NOT NULL,
 "Descripción" Text NOT NULL,
 "Prioridad" Character(1) NOT NULL,
 "Estado" Character(1) NOT NULL,
 "DNI/CIF" Character(10) NOT NULL,
 "Dirección" Text NOT NULL,
 "DNI" Character(10)
)
;

-- Create indexes for table Peticion de trabajo

CREATE INDEX "IX_realiza" ON "Peticion de trabajo" ("DNI/CIF")
;

CREATE INDEX "IX_realizada en" ON "Peticion de trabajo" ("Dirección")
;

CREATE INDEX "IX_se_asigna" ON "Peticion de trabajo" ("DNI")
;

CREATE INDEX "estado_b" ON "Peticion de trabajo" ("Estado")
;

CREATE INDEX "prioridad_b" ON "Peticion de trabajo" ("Prioridad")
;

-- Add keys for table Peticion de trabajo

ALTER TABLE "Peticion de trabajo" ADD CONSTRAINT "Fecha" PRIMARY KEY ("Fecha")
;

-- Table Parte de trabajo

CREATE TABLE "Parte de trabajo"(
 "Fecha_inicio" Timestamp(6) NOT NULL,
 "Precio_hora" Smallint NOT NULL,
 "Fecha_fin" Timestamp(6),
 "Fecha" Timestamp(6) NOT NULL
)
;

-- Create indexes for table Parte de trabajo

CREATE INDEX "IX_Relationship1" ON "Parte de trabajo" ("Fecha")
;

-- Add keys for table Parte de trabajo

ALTER TABLE "Parte de trabajo" ADD CONSTRAINT "Fecha_inicio" PRIMARY KEY ("Fecha_inicio")
;

-- Table Coordinador técnico

CREATE TABLE "Coordinador técnico"(
 "DNI" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "email" Text NOT NULL,
 "Dirección" Text NOT NULL,
 "Estado" Text,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Coordinador técnico

CREATE INDEX "IX_Trabaja_en_1" ON "Coordinador técnico" ("Dirección")
;

-- Add keys for table Coordinador técnico

ALTER TABLE "Coordinador técnico" ADD CONSTRAINT "Unique_Identifier1" PRIMARY KEY ("DNI")
;

-- Create triggers for table Coordinador técnico

CREATE TRIGGER "Inheritance_Coordinador técnico"
  BEFORE INSERT
  ON "Coordinador técnico"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Coordinador técnico"()
;

-- Table Ayudante técnico

CREATE TABLE "Ayudante técnico"(
 "DNI" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "email" Text NOT NULL,
 "Dirección" Text NOT NULL,
 "Estado" Text,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Ayudante técnico

CREATE INDEX "IX_Trabaja_en_4" ON "Ayudante técnico" ("Dirección")
;

-- Add keys for table Ayudante técnico

ALTER TABLE "Ayudante técnico" ADD CONSTRAINT "Unique_Identifier2" PRIMARY KEY ("DNI")
;

-- Create triggers for table Ayudante técnico

CREATE TRIGGER "Inheritance_Ayudante técnico"
  BEFORE INSERT
  ON "Ayudante técnico"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Ayudante técnico"()
;

-- Table Responsable del almacén

CREATE TABLE "Responsable del almacén"(
 "DNI" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "email" Text NOT NULL,
 "Dirección" Text NOT NULL,
 "Estado" Text,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Responsable del almacén

CREATE INDEX "IX_Trabaja_en_2" ON "Responsable del almacén" ("Dirección")
;

-- Add keys for table Responsable del almacén

ALTER TABLE "Responsable del almacén" ADD CONSTRAINT "Unique_Identifier3" PRIMARY KEY ("DNI")
;

-- Create triggers for table Responsable del almacén

CREATE TRIGGER "Inheritance_Responsable del almacén"
  BEFORE INSERT
  ON "Responsable del almacén"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Responsable del almacén"()
;

-- Table Ayudante del almacén

CREATE TABLE "Ayudante del almacén"(
 "DNI" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "email" Text NOT NULL,
 "Dirección" Text NOT NULL,
 "Estado" Text,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Ayudante del almacén

CREATE INDEX "IX_Trabaja_en_3" ON "Ayudante del almacén" ("Dirección")
;

-- Add keys for table Ayudante del almacén

ALTER TABLE "Ayudante del almacén" ADD CONSTRAINT "Unique_Identifier4" PRIMARY KEY ("DNI")
;

-- Create triggers for table Ayudante del almacén

CREATE TRIGGER "Inheritance_Ayudante del almacén"
  BEFORE INSERT
  ON "Ayudante del almacén"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Ayudante del almacén"()
;

-- Table Técnico informático

CREATE TABLE "Técnico informático"(
 "DNI" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "email" Text NOT NULL,
 "Dirección" Text NOT NULL,
 "Estado" Text,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Técnico informático

CREATE INDEX "IX_Trabaja_en_5" ON "Técnico informático" ("Dirección")
;

-- Add keys for table Técnico informático

ALTER TABLE "Técnico informático" ADD CONSTRAINT "Unique_Identifier5" PRIMARY KEY ("DNI")
;

-- Create triggers for table Técnico informático

CREATE TRIGGER "Inheritance_Técnico informático"
  BEFORE INSERT
  ON "Técnico informático"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Técnico informático"()
;

-- Table Oficina

CREATE TABLE "Oficina"(
 "Dirección" Text NOT NULL,
 "Tipo" Character(1) NOT NULL
)
;

-- Add keys for table Oficina

ALTER TABLE "Oficina" ADD CONSTRAINT "Dirección" PRIMARY KEY ("Dirección")
;

-- Table Presupuesto

CREATE TABLE "Presupuesto"(
 "Fecha_emisión" Timestamp(6) NOT NULL,
 "Horas" Smallint NOT NULL,
 "Precio_hora" Smallint NOT NULL,
 "Fecha" Timestamp(6) NOT NULL
)
;

-- Create indexes for table Presupuesto

CREATE INDEX "IX_se_planifica" ON "Presupuesto" ("Fecha")
;

-- Add keys for table Presupuesto

ALTER TABLE "Presupuesto" ADD CONSTRAINT "Unique_Identifier7" PRIMARY KEY ("Fecha_emisión")
;

-- Table Pieza especial

CREATE TABLE "Pieza especial"(
 "ID" Smallint NOT NULL,
 "Precio_venta" Smallint NOT NULL,
 "Precio_compra" Smallint NOT NULL,
 "Cantidad_almacén" Smallint NOT NULL,
 "Fecha_uso" Timestamp(6),
 "Cantidad_necesario" Smallint,
 "CIF" Character(10) NOT NULL,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Pieza especial

CREATE INDEX "IX_suministra_1" ON "Pieza especial" ("CIF")
;

CREATE INDEX "IX_almacenada en_1" ON "Pieza especial" ("Dirección")
;

-- Add keys for table Pieza especial

ALTER TABLE "Pieza especial" ADD CONSTRAINT "Unique_Identifier8" PRIMARY KEY ("ID")
;

-- Create triggers for table Pieza especial

CREATE TRIGGER "Inheritance_Pieza especial"
  BEFORE INSERT
  ON "Pieza especial"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Pieza especial"()
;

-- Table Pieza básica

CREATE TABLE "Pieza básica"(
 "ID" Smallint NOT NULL,
 "Precio_venta" Smallint NOT NULL,
 "Precio_compra" Smallint NOT NULL,
 "Cantidad_almacén" Smallint NOT NULL,
 "Stock_minimo" Smallint NOT NULL,
 "cantidad_pedido" Smallint NOT NULL,
 "CIF" Character(10) NOT NULL,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Pieza básica

CREATE INDEX "IX_suministra_2" ON "Pieza básica" ("CIF")
;

CREATE INDEX "IX_almacenada en_2" ON "Pieza básica" ("Dirección")
;

-- Add keys for table Pieza básica

ALTER TABLE "Pieza básica" ADD CONSTRAINT "Unique_Identifier9" PRIMARY KEY ("ID")
;

-- Create triggers for table Pieza básica

CREATE TRIGGER "Inheritance_Pieza básica"
  BEFORE INSERT
  ON "Pieza básica"
 FOR EACH ROW
 EXECUTE PROCEDURE "Inheritance_Pieza básica"()
;

-- Table Proveedor

CREATE TABLE "Proveedor"(
 "CIF" Character(10) NOT NULL,
 "Nombre" Text NOT NULL,
 "Teléfono" Character(11) NOT NULL,
 "Dirección" Text,
 "email" Text
)
;

-- Add keys for table Proveedor

ALTER TABLE "Proveedor" ADD CONSTRAINT "Unique_Identifier10" PRIMARY KEY ("CIF")
;

-- Table Pedido

CREATE TABLE "Pedido"(
 "Fecha" Time NOT NULL,
 "estado" Character(1) NOT NULL,
 "tipo_pedido" Boolean NOT NULL,
 "CIF" Character(10) NOT NULL,
 "Dirección" Text NOT NULL
)
;

-- Create indexes for table Pedido

CREATE INDEX "IX_pertenece" ON "Pedido" ("CIF")
;

CREATE INDEX "IX_pedido en" ON "Pedido" ("Dirección")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "Index_HASH_Fecha" EXCLUDE USING hash ("Fecha")
 DEFERRABLE
 INITIALLY DEFERRED
;

-- Add keys for table Pedido

ALTER TABLE "Pedido" ADD CONSTRAINT "Unique_Identifier11" PRIMARY KEY ("Fecha")
;

-- Table Factura

CREATE TABLE "Factura"(
 "Numero" Bigint NOT NULL,
 "fecha_factura" Timestamp(6) NOT NULL,
 "Fecha" Timestamp(6) NOT NULL
)
;

-- Create indexes for table Factura

CREATE INDEX "IX_facturado" ON "Factura" ("Fecha")
;

-- Add keys for table Factura

ALTER TABLE "Factura" ADD CONSTRAINT "Unique_Identifier14" PRIMARY KEY ("Numero")
;

ALTER TABLE "Factura" ADD CONSTRAINT "Unique_Identifier16" UNIQUE ("fecha_factura")
;

-- Table tiene

CREATE TABLE "tiene"(
 "Fecha_emisión" Timestamp(6) NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table tiene

ALTER TABLE "tiene" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha_emisión","ID")
;

-- Table tiene

CREATE TABLE "tiene"(
 "Fecha_emisión" Timestamp(6) NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table tiene

ALTER TABLE "tiene" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha_emisión","ID")
;

-- Table consume

CREATE TABLE "consume"(
 "Fecha_inicio" Timestamp(6) NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table consume

ALTER TABLE "consume" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha_inicio","ID")
;

-- Table consume

CREATE TABLE "consume"(
 "Fecha_inicio" Timestamp(6) NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table consume

ALTER TABLE "consume" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha_inicio","ID")
;

-- Table trae_basico

CREATE TABLE "trae_basico"(
 "Fecha" Time NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table trae_basico

ALTER TABLE "trae_basico" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha","ID")
;

-- Table trae_especial

CREATE TABLE "trae_especial"(
 "Fecha" Time NOT NULL,
 "ID" Smallint NOT NULL
)
;

-- Add keys for table trae_especial

ALTER TABLE "trae_especial" ADD CONSTRAINT "Key1" PRIMARY KEY ("Fecha","ID")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Peticion de trabajo" ADD CONSTRAINT "realiza" FOREIGN KEY ("DNI/CIF") REFERENCES "Cliente" ("DNI/CIF") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Presupuesto" ADD CONSTRAINT "se_planifica" FOREIGN KEY ("Fecha") REFERENCES "Peticion de trabajo" ("Fecha") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Pedido" ADD CONSTRAINT "pertenece" FOREIGN KEY ("CIF") REFERENCES "Proveedor" ("CIF") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Factura" ADD CONSTRAINT "facturado" FOREIGN KEY ("Fecha") REFERENCES "Peticion de trabajo" ("Fecha") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Peticion de trabajo" ADD CONSTRAINT "realizada en" FOREIGN KEY ("Dirección") REFERENCES "Oficina" ("Dirección") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Pedido" ADD CONSTRAINT "pedido en" FOREIGN KEY ("Dirección") REFERENCES "Oficina" ("Dirección") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Peticion de trabajo" ADD CONSTRAINT "se_asigna" FOREIGN KEY ("DNI") REFERENCES "Técnico informático" ("DNI") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Parte de trabajo" ADD CONSTRAINT "se_realiza" FOREIGN KEY ("Fecha") REFERENCES "Peticion de trabajo" ("Fecha") ON DELETE NO ACTION ON UPDATE NO ACTION
;




