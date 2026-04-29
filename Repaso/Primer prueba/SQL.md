# SQL (Structured Query Language)

## Tipos de comandos

### DDL (Definición de datos)
- CREATE: crear estructuras
- ALTER: modificar
- DROP: eliminar

### DML (Manipulación de datos)
- SELECT: consultar
- INSERT: insertar
- UPDATE: actualizar
- DELETE: eliminar

## Consultas básicas

### Selección
SELECT * FROM tabla;

### Condiciones
SELECT * FROM tabla WHERE condicion;

### Ordenamiento
SELECT * FROM tabla ORDER BY columna;

## Funciones agregadas
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

## Agrupación
SELECT columna, COUNT(*) FROM tabla GROUP BY columna;

## JOINs

### INNER JOIN
Devuelve coincidencias en ambas tablas.

### LEFT JOIN
Devuelve todos los registros de la izquierda.

### RIGHT JOIN
Devuelve todos los registros de la derecha.

## Ejemplo de JOIN
SELECT *
FROM usuarios
INNER JOIN pedidos
ON usuarios.id = pedidos.usuario_id;

## Subconsultas
Consulta dentro de otra consulta.

## Vistas
Tablas virtuales basadas en consultas.

## Índices
Mejoran la velocidad de búsqueda.

## Seguridad en SQL
- Control de usuarios
- Permisos