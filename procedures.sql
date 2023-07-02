CREATE PROCEDURE mi_transaccion()
LANGUAGE plpgsql AS 
$$
DECLARE
   tot integer DEFAULT 0;
BEGIN
   INSERT INTO ventas (cliente_id, carrito_id, fecha_venta, monto_total, estatus, fecha_envio)
   VALUES (10, 10, NOW(), 2000, 'activa', '2023-08-10');
   
   INSERT INTO ventas_prod (product_id, cantidad_vendida, precio, subtotal, venta_id)
   VALUES (10, 10, 102, 10000, (SELECT MAX(id_venta) FROM ventas));
   
   tot := verificar_cantexistente(3, 10);
   
   IF (tot = 1) THEN 
      COMMIT;
   ELSE
      ROLLBACK;
   END IF;
END;
$$