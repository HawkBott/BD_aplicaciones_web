
// TABLAS CON FK

-- Tabla Productos - bienes inmuebles
CREATE TABLE product_bienes_inmuebles (
  numero_predio INT,
  precio_venta DECIMAL(10, 2),
  superficie_terreno DECIMAL(10, 2),
  superficie_construida DECIMAL(10, 2),
  year_construction INT,
  fecha_adquisicion DATE,
  foto VARCHAR(255),
  detalles_product_id INT,
  costo DECIMAL (10, 2),
  cantexistente INT,
  id_product SERIAL PRIMARY KEY,
  FOREIGN KEY (detalles_product_id) REFERENCES detalles_product(id_detalles_product) ON DELETE CASCADE
);


-- Tabla de Detalles del Product
CREATE TABLE detalles_product (
  id_detalles_product SERIAL PRIMARY KEY,
  total_habitaciones INT,
  niveles INT,
  num_recamaras INT,
  num_banos INT,
  tipo_casa VARCHAR(100),
  uso_suelo VARCHAR(100),
  cantidad_departamentos INT,
  estatus VARCHAR(100),
  categoria_id INT,
  marca_id INT,
  caracteristicas TEXT[]
  FOREIGN KEY (categoria_id) REFERENCES tipo (id_tipo) ON DELETE CASCADE,
  FOREIGN KEY (marca_id) REFERENCES marcas (id_marca) ON DELETE CASCADE
);


-- Tabla de Usuarios
CREATE TABLE usuarios (
  id_usuario SERIAL PRIMARY KEY,
  email VARCHAR(100),
  password VARCHAR(100),
  nombreUsuario VARCHAR(100),
  emailExtra VARCHAR(100),
  fechaRegistro DATE,
  firmaDigital VARCHAR(255),
  rol_id INT,
  FOREIGN KEY (rol_id) REFERENCES roles(id_rol) ON DELETE CASCADE
);

-- Tabla de Empleados
CREATE TABLE empleados (
  id_empleado SERIAL PRIMARY KEY,
  tipo_empleado VARCHAR(100),
  departamento_id INT,
  puesto VARCHAR (255),
  salarios INT,
  FOREIGN KEY (departamento_id) REFERENCES departamentos(id_departamento) ON DELETE CASCADE
); 


-- Tabla de Carritos
CREATE TABLE carrito (
  id_carrito SERIAL PRIMARY KEY,
  fecha_pedido DATE,
  estatus VARCHAR(100),
  sub_total DECIMAL(10, 2),
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

-- Tabla de Formas de Pago
CREATE TABLE formas_pago (
  num_autorizacion VARCHAR(100),
  fechaPago DATE,
  tipoPago VARCHAR(100),
  carrito_id INT,
  id_forma_pago SERIAL PRIMARY KEY,
  FOREIGN KEY (carrito_id) REFERENCES carrito(id_carrito) ON DELETE CASCADE
);

create table if not exists state (
    id_estado serial primary key,
    estado VARCHAR(100),
    country_id int,
    FOREIGN KEY (country_id) REFERENCES country(id_country)
);


create table if not exists address (
    id_address serial primary key,
    calle VARCHAR(100),
    numero_exterior INT,
    numero_interior INT,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id_country)
);

-- Tabla municipios
create table if not exists municipios (
    id_municipio serial primary key,
    name_municipio varchar (255),
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES states(id_state)
);

-- Tabla de codigo postal
create table if not exists cp (
    id_cp serial primary key,
    cp VARCHAR(100),
    municipio_id INT,
    FOREIGN KEY (municipio_id) REFERENCES municipios(id_municipio)
);

CREATE TABLE cp (
    id_cp serial primary key,
    cp VARCHAR(100),
    municipio_id INT,
    FOREIGN KEY (municipio_id) REFERENCES municipios(id_municipio)
);


CREATE TABLE carrito_productos(
    id_carritoprod serial primary key,
    cantidadpedido INT,
    precio INT,
    descuento INT,
    carrito_id INT,
    product_bienes_inmuebles_id INT,
    FOREIGN KEY (carrito_id) REFERENCES carrito(id_carrito)
    FOREIGN KEY (product_bienes_inmuebles_id) REFERENCES product_bienes_inmuebles(id_product_bienes_inmuebles)
);


-- Tabla ventas
CREATE TABLE ventas (
  id_venta SERIAL PRIMARY KEY,
  cliente_id INT,
  carrito_id INT,
  fecha_venta DATE,
  monto_total DECIMAL (10,2),
  estatus VARCHAR (255),
  fecha_envio DATE,
  FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente) ON DELETE CASCADE,
  FOREIGN KEY (carrito_id) REFERENCES carrito(id_carrito) ON DELETE CASCADE
);

-- Tabla Ventas Productos
CREATE TABLE ventas_prod (
  id_ventas_prod SERIAL PRIMARY KEY,
  product_id INT,
  cantidad_vendida INT,
  precio DECIMAL (10,2),
  subtotal DECIMAL (10,2),
  venta_id INT,
  FOREIGN KEY (product_id) REFERENCES product_bienes_inmuebles (id_product) ON DELETE CASCADE,
  FOREIGN KEY (venta_id) REFERENCES ventas (id_venta) ON DELETE CASCADE
);