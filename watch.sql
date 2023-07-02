/*ver get*/

SELECT proname, proargnames, proargtypes
FROM pg_proc
WHERE pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');


/* ver funciones */

SELECT routine_name, routine_type
FROM information_schema.routines
WHERE specific_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY routine_name;

drop funtion (nombre de la funcion ())

/* ver tiggers */ 
SELECT trigger_name, event_object_table, action_statement
FROM information_schema.triggers
WHERE trigger_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY trigger_name;

/* ver tablas creadas */ 
SELECT table_name
FROM information_schema.tables
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
AND table_type = 'BASE TABLE';

/* ver estructura de una tabla */
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'nombre_de_la_tabla';

/* Ver los procedimientos que tengo creados*/ 
SELECT proname, nspname
FROM pg_catalog.pg_proc p
JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
WHERE n.nspname = 'public'; -- Reemplaza 'public' con el esquema donde creaste tus procedimientos, si es diferente

DROP PROCEDURE IF EXISTS (nombre del procedimiento ());




