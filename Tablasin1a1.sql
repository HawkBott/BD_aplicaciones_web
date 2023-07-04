
//Tablas principales

-- Tabla de Proveedores
CREATE TABLE owner (
  id_owner SERIAL PRIMARY KEY,
  razon_social VARCHAR(100),
  rfc VARCHAR(20),
  telowner VARCHAR(20),
  paginaWeb VARCHAR(100)
);

-- Tabla de clientes
CREATE TABLE clientes (
  id_cliente SERIAL PRIMARY KEY,
  personal_identification varchar (255)
);

-- Tabla de Marcas
CREATE TABLE tipo (
  id_tipo SERIAL PRIMARY KEY,
  logotipo VARCHAR(255),
  categoria varchar (255)
);

-- Tabla de Roles
CREATE TABLE roles (
  id_rol SERIAL PRIMARY KEY,
  tipo_rol VARCHAR(100),
  estatus VARCHAR(100)
);

-- Tabla de Departamentos
CREATE TABLE departamentos (
  id_departamento SERIAL PRIMARY KEY,
  nombre_dep VARCHAR(100)
);


CREATE TABLE servicios (
  id_servicios SERIAL PRIMARY KEY,
  electricidad BOOLEAN,
  agua BOOLEAN,
  bano BOOLEAN,
  predial_pagado BOOLEAN,
  drenaje BOOLEAN
);


CREATE TABLE marcas (
  id_marca serial primary key,
  marca varchar (255)
);

create table if not exists country (
    id_country serial primary key,
    pais VARCHAR(100),
    state_id int,
);