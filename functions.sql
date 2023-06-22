--Function get_prod_catego BUSCAR POR CATEGORIA

CREATE OR REPLACE FUNCTION get_prod_catego(nombre_categoria varchar)
RETURNS TABLE (
    id_product INT,
    numero_predio INT,
    precio_venta DECIMAL(10, 2),
    superficie_terreno DECIMAL(10, 2),
    superficie_construida DECIMAL(10, 2),
    year_construction INT,
    fecha_adquisicion DATE,
    foto VARCHAR(255),
    detalles_product_id INT
)
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN QUERY
    SELECT p.id_product,
           p.numero_predio,
           p.precio_venta,
           p.superficie_terreno,
           p.superficie_construida,
           p.year_construction,
           p.fecha_adquisicion,
           p.foto,
           p.detalles_product_id
    FROM product_bienes_inmuebles AS p
    INNER JOIN detalles_product AS det ON p.detalles_product_id = det.id_detalles_product
    INNER JOIN tipo AS t ON det.categoria_id = t.id_tipo
    WHERE t.categoria = nombre_categoria;
END;
$$



--get_prod_serv_detal_owner BUSCAR POR id_product

CREATE OR REPLACE FUNCTION get_prod_serv_detal_owner(idproducto int)
RETURNS TABLE (
    id_product INT,
    precio_venta DECIMAL(10, 2),
    id_servicios INT,
    predial_pagado BOOLEAN,
    detalles_product_id INT,
    total_habitaciones INT,
    id_owner INT,
    telowner VARCHAR(20)
)
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN QUERY
    SELECT p.id_product,
           p.precio_venta,
           s.id_servicios,
           s.predial_pagado,
           det.id_detalles_product,
           det.total_habitaciones,
           o.id_owner,
           o.telowner
    FROM product_bienes_inmuebles AS p
    INNER JOIN tiene_product_bienes_inmueblesyserviciosydetalles_productyowner AS tiene ON tiene.id_product_bienes_inmuebles = p.id_product
    INNER JOIN detalles_product AS det ON tiene.id_detalles_product = det.id_detalles_product
    INNER JOIN servicios AS s ON tiene.id_servicios = s.id_servicios
    INNER JOIN owner AS o ON tiene.id_owner = o.id_owner
    WHERE p.id_product = idproducto;
END;
$$



--get_prod_marc_owner BUSCAR POR MARCA Y DUEÑIO

CREATE OR REPLACE FUNCTION get_prod_marc_owner(marcaN varchar, ownerM varchar)
RETURNS TABLE (
    id_product INT,
    numero_predio INT,
    precio_venta DECIMAL(10, 2),
    superficie_terreno DECIMAL(10, 2),
    superficie_construida DECIMAL(10, 2),
    year_construction INT,
    fecha_adquisicion DATE,
    foto VARCHAR(255),
    detalles_product_id INT
)
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN QUERY
    SELECT p.id_product,
           p.numero_predio,
           p.precio_venta,
           p.superficie_terreno,
           p.superficie_construida,
           p.year_construction,
           p.fecha_adquisicion,
           p.foto,
           p.detalles_product_id

    FROM product_bienes_inmuebles AS p
    INNER JOIN tiene_productytipoyownerycountryymarcas AS tiene ON tiene.id_product = p.id_product
    INNER JOIN marcas AS m ON tiene.id_marca = m.id_marca
    INNER JOIN owner AS o ON tiene.id_owner = o.id_owner
    WHERE m.marca = marcaN AND o.rfc = ownerM;
END;
$$



--get_prod_clien_car BUSCAR POR id_cliente

CREATE OR REPLACE FUNCTION get_prod_clien_car(idclien int)
RETURNS TABLE (

id_carrito INT,
id_cliente INT,
personal_identification varchar (255),
id_product INT,
numero_predio INT,
cantidadpedido INT
)

LANGUAGE plpgsql AS
$$
BEGIN
RETURN QUERY
SELECT
car.id_carrito,
cl.id_cliente,
cl.personal_identification,
p.id_product,
p.numero_predio,
carp.cantidadpedido

FROM product_bienes_inmuebles AS p

INNER JOIN carrito_productos AS carp ON carp.product_bienes_inmuebles_id = p.id_product

INNER JOIN carrito AS car ON carp.carrito_id = car.id_carrito

INNER JOIN clientes AS cl ON car.cliente_id = cl.id_cliente

WHERE car.cliente_id = idclien;

END;
$$



--get_prod_clien_fech BUSCAR POR FECHA

CREATE OR REPLACE FUNCTION get_prod_clien_fech(my_fecha date)
RETURNS TABLE (
  id_carrito INT,
  fecha_pedido date,
  id_cliente INT,
  personal_identification varchar(255),
  id_product INT,
  numero_predio INT,
  cantidadpedido INT
)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  SELECT
    car.id_carrito,
    car.fecha_pedido,
    cl.id_cliente,
    cl.personal_identification,
    p.id_product,
    p.numero_predio,
    carp.cantidadpedido
  FROM
    product_bienes_inmuebles AS p
    INNER JOIN carrito_productos AS carp ON carp.product_bienes_inmuebles_id = p.id_product
    INNER JOIN carrito AS car ON carp.carrito_id = car.id_carrito
    INNER JOIN clientes AS cl ON car.cliente_id = cl.id_cliente
  WHERE
    car.fecha_pedido = my_fecha;
END;
$$;



--get_prod_clien_fech_two BUSCAR POR FECHA y id_cliente

CREATE OR REPLACE FUNCTION get_prod_clien_fech_two(my_fecha date, my_cliente INT)
RETURNS TABLE (
  id_carrito INT,
  fecha_pedido date,
  id_cliente INT,
  personal_identification varchar(255),
  id_product INT,
  numero_predio INT,
  cantidadpedido INT
)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  SELECT
    car.id_carrito,
    car.fecha_pedido,
    cl.id_cliente,
    cl.personal_identification,
    p.id_product,
    p.numero_predio,
    carp.cantidadpedido
  FROM
    product_bienes_inmuebles AS p
    INNER JOIN carrito_productos AS carp ON carp.product_bienes_inmuebles_id = p.id_product
    INNER JOIN carrito AS car ON carp.carrito_id = car.id_carrito
    INNER JOIN clientes AS cl ON car.cliente_id = cl.id_cliente
  WHERE
    car.fecha_pedido = my_fecha and cl.id_cliente = my_cliente;
END;
$$;


/*function and trigger sumas contidad existente de los productos*/

CREATE FUNCTION sumar_cantexistente()
RETURNS TRIGGER 
LANGUAGE plpgsql

AS $$
BEGIN
  NEW.cantexistente = OLD.cantexistente + NEW.cantexistente;
  RETURN NEW;
END;
$$

CREATE TRIGGER sumar_cantexistente_trigger
BEFORE UPDATE ON product_bienes_inmuebles
FOR EACH ROW
EXECUTE FUNCTION sumar_cantexistente();

UPDATE product_bienes_inmuebles
SET cantexistente = 200
WHERE id_product = 2;

