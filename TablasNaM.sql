
-- Tabla de Relaciones


CREATE TABLE vende_ownerYProduct (
  id_owner INT,
  id_product INT,
  PRIMARY KEY (id_owner, id_product),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product)
);

CREATE TABLE tiene_productYtipo (
  id_tipo INT,
  id_product INT,
  PRIMARY KEY (id_tipo, id_product),
  FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product)
);

CREATE TABLE pertenece_empleadoYdepartamento (
  id_empleado INT,
  id_departamento INT,
  PRIMARY KEY (id_empleado, id_departamento),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
  FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);


CREATE TABLE pertenece_clienteYcarrito (
  id_empleado INT,
  id_carrito INT,
  PRIMARY KEY (id_empleado, id_carrito),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito)
);

CREATE TABLE realiza_empleadoYcarrito (
  id_cliente INT,
  id_carrito INT,
  PRIMARY KEY (id_cliente, id_carrito),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito)
);

CREATE TABLE utiliza_carritoYforma_pago (
  id_carrito INT,
  id_forma_pago INT,
  PRIMARY KEY (id_carrito, id_forma_pago),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_forma_pago) REFERENCES formas_pago(id_forma_pago)
);


//TABLA para la relacion de proveedores y direccion
CREATE TABLE tiene_ownerYaddress (
  id_owner INT,
  id_address INT,
  PRIMARY KEY (id_owner, id_address),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner),
  FOREIGN KEY (id_address) REFERENCES address(id_address)
);