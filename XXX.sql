Tengo la tabla ya creada en postgreesql y quiero cambiar el "id_owner INT PRIMARY KEY" a "id_owner SERIAL PRIMARY KEY":.
Esta es tabla:
-- Tabla de Proveedores
CREATE TABLE owner (
  id_owner INT PRIMARY KEY,
  razon_social VARCHAR(100),
  rfc VARCHAR(20),
  telowner VARCHAR(20),
  paginaWeb VARCHAR(100)
);


Sigue estos pasos:
-- Paso 1: Eliminar la clave externa
ALTER TABLE ventas DROP CONSTRAINT ventas_cliente_id_fkey;
ALTER TABLE ventas DROP CONSTRAINT ventas_carrito_id_fkey;

-- Paso 2: Crear una secuencia
CREATE SEQUENCE ventas_id_venta_seq;

-- Paso 3: Agregar una nueva columna "id_venta_new" como tipo "integer"
ALTER TABLE ventas
    ADD COLUMN id_venta_new INTEGER;

-- Paso 4: Actualizar los valores de la nueva columna utilizando la secuencia
UPDATE ventas
    SET id_venta_new = nextval('ventas_id_venta_seq');

-- Paso 5: Eliminar la columna "id_venta" anterior
ALTER TABLE ventas
    DROP COLUMN id_venta;

-- Paso 6: Renombrar la columna "id_venta_new" a "id_venta"
ALTER TABLE ventas
    RENAME COLUMN id_venta_new TO id_venta;

-- Paso 7: Establecer la nueva columna "id_venta" como serial primary key
ALTER TABLE ventas
    ALTER COLUMN id_venta SET DEFAULT nextval('ventas_id_venta_seq'),
    ALTER COLUMN id_venta SET NOT NULL,
    ADD PRIMARY KEY (id_venta);

-- Paso 8: Volver a agregar las claves externas
ALTER TABLE ventas
    ADD CONSTRAINT ventas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente),
    ADD CONSTRAINT ventas_carrito_id_fkey FOREIGN KEY (carrito_id) REFERENCES carrito(id_carrito);