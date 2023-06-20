/*ver get*/

SELECT proname, proargnames, proargtypes
FROM pg_proc
WHERE pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');


/* ver funciones */

SELECT routine_name, routine_type
FROM information_schema.routines
WHERE specific_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY routine_name;


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
