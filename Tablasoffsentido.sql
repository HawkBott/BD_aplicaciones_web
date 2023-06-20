CREATE TABLE tiene_productYaddress (
  id_product INT,
  id_address INT,
  PRIMARY KEY (id_product, id_address),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product),
  FOREIGN KEY (id_address) REFERENCES address(id_address)
);


CREATE TABLE tiene_productYmarcas (
  id_product INT,
  id_marcaINT,
  PRIMARY KEY (id_product, id_marca),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product),
  FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);


CREATE TABLE tiene_productYtipoYownerYcountry (
  id_product INT,
  id_tipo INT,
  id_owner INT,
  id_country INT, 
  PRIMARY KEY (id_product, id_tipo, id_owner, id_country),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product),
  FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner),
  FOREIGN KEY (id_country) REFERENCES country(id_country)
);


CREATE TABLE tiene_productYtipoYownerYcountryYmarcas (
  id_product INT,
  id_tipo INT,
  id_owner INT,
  id_country INT, 
  id_marca INT,
  PRIMARY KEY (id_product, id_tipo, id_owner, id_country, id_marca),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product),
  FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner),
  FOREIGN KEY (id_country) REFERENCES country(id_country),
  FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

INSERT INTO tiene_productYtipoYownerYcountryYmarcas (id_product, id_tipo, id_owner, id_country, id_marca)
VALUES (1, 2, 3, 4, 5);

CREATE TABLE tiene_usuariosYempleadosYaddress (
  id_usuario INT,
  id_empleado INT,
  id_address INT,
  PRIMARY KEY (id_usuario, id_empleado, id_address),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
  FOREIGN KEY (id_address) REFERENCES address(id_address)
);

CREATE TABLE tiene_usuariosYowner (
  id_usuario INT,
  id_owner INT,
  PRIMARY KEY (id_usuario, id_owner),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner)
);

CREATE TABLE tiene_usuariosYownerYaddress (
  id_usuario INT,
  id_owner INT,
  id_address INT,
  PRIMARY KEY (id_usuario, id_owner, id_address),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner),
  FOREIGN KEY (id_address) REFERENCES address(id_address)
);

CREATE TABLE tiene_usuariosYclientesYaddress (
  id_cliente INT,
  id_address INT,
  PRIMARY KEY (id_cliente, id_address),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_address) REFERENCES address(id_address)
);

CREATE TABLE tiene_product_bienes_inmueblesyserviciosydetalles_productyowner (
  id_product INT,
  id_servicios INT,
  id_detalles_product INT,
  id_owner INT,
  PRIMARY KEY (id_product, id_servicios, id_detalles_product, id_owner),
  FOREIGN KEY (id_product) REFERENCES product_bienes_inmuebles(id_product),
  FOREIGN KEY (id_servicios) REFERENCES servicios(id_servicios),
  FOREIGN KEY (id_detalles_product) REFERENCES detalles_product(id_detalles_product),
  FOREIGN KEY (id_owner) REFERENCES owner(id_owner)
);
