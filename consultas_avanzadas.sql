/*1.     
La siguiente consulta selecciona el departamento
con el salario promedio más alto. La subconsulta busca el salario promedio de
cada departamento y luego la consulta principal selecciona el departamento con
el salario promedio más alto. */ 


SELECT depa.nombre_dep, MAX(em.salarios) AS salario_maximo
FROM empleados AS em
INNER JOIN departamentos AS depa ON em.departamento_id = depa.id_departamento
WHERE em.salarios > (
    SELECT AVG(salarios) AS total
    FROM empleados AS em
    INNER JOIN departamentos AS depa ON em.departamento_id = depa.id_departamento
)
GROUP BY depa.id_departamento;


/*1. mostrar
los datos de todos los clientes que la fecha de envió es la fecha más reciente.
obtenerlo de la tabla ventas, */

SELECT c.id_cliente, c.personal_identification
FROM clientes AS c
WHERE c.id_cliente IN (
    SELECT DISTINCT car.cliente_id
    FROM carrito AS car
    INNER JOIN carrito_productos AS cp ON car.id_carrito = cp.carrito_id
    INNER JOIN ventas AS v ON car.cliente_id = v.cliente_id
    WHERE v.fecha_envio = (SELECT MAX(fecha_envio) FROM ventas)
);


/*1.     
La empresa desea saber cuánto tendrá que pagar
al SAT por concepto de iva. Calcular la suma total del iva, el iva es el 16 %
del precio venta en la tabla productos */

SELECT numero_predio, precio_venta, costo,
  (SELECT SUM(precio_venta * 0.16) FROM product_bienes_inmuebles) AS IVA_TOTAL
FROM product_bienes_inmuebles;