# A. Investigación Comparativa y Metodológica

Tema

Diferencias arquitectónicas entre Procedimientos Almacenados, Funciones y Triggers en SGBD

## Objetivo

Analizar cómo se implementan los procedimientos almacenados, las funciones y los triggers en distintos Sistemas Gestores de Bases de Datos (SGBD), comparando sus características, sintaxis y formas de ejecución en motores como PostgreSQL, MySQL/MariaDB y SQL Server.

---

## 1. Procedimientos Almacenados

Los procedimientos almacenados son conjuntos de instrucciones SQL y lógica de programación que se guardan directamente dentro del servidor de base de datos. Se ejecutan cuando un usuario o una aplicación los invoca.

Pueden recibir parámetros, realizar consultas, modificar datos y ejecutar varias operaciones relacionadas.

Una de sus principales ventajas es que permiten centralizar operaciones complejas dentro del SGBD, evitando que toda la lógica tenga que estar implementada en la aplicación.

Por ejemplo, un procedimiento podría utilizarse para registrar una venta y actualizar automáticamente el stock de los productos involucrados.

Características principales

- Se ejecutan mediante una llamada explícita.
- Pueden recibir parámetros.
- Pueden realizar operaciones "INSERT", "UPDATE" y "DELETE".
- Pueden contener estructuras de control como condiciones y bucles.
- Pueden trabajar con transacciones, dependiendo del SGBD.
- Permiten centralizar lógica de negocio en el servidor.

---

## 2. Funciones

Las funciones son rutinas almacenadas en la base de datos que generalmente reciben datos de entrada, realizan un procesamiento y devuelven un resultado.

Una función puede utilizarse dentro de una consulta SQL, dependiendo del motor y del tipo de función.

Por ejemplo, se podría crear una función que reciba el precio de un producto y un porcentaje de descuento y devuelva el precio final.

Características principales

- Pueden recibir parámetros.
- Generalmente devuelven un valor o conjunto de valores.
- Pueden utilizarse dentro de consultas.
- Permiten reutilizar cálculos y operaciones.
- Su sintaxis y restricciones dependen del SGBD utilizado.

---

## 3. Triggers o Disparadores

Los triggers son objetos de la base de datos que ejecutan automáticamente una acción cuando ocurre determinado evento sobre una tabla o vista.

Los eventos más comunes son:

INSERT
UPDATE
DELETE

A diferencia de los procedimientos almacenados y las funciones, normalmente el usuario no ejecuta directamente un trigger. Este se activa como consecuencia de otra operación.

Por ejemplo, un trigger podría registrar automáticamente en una tabla de auditoría los cambios realizados sobre el precio de un producto.

BEFORE y AFTER

Los triggers pueden ejecutarse en diferentes momentos dependiendo del SGBD.

- BEFORE: se ejecuta antes de realizar la operación.
- AFTER: se ejecuta después de realizar la operación.

Un trigger "BEFORE INSERT" podría utilizarse para validar información antes de guardar un registro, mientras que un "AFTER UPDATE" podría utilizarse para registrar los cambios realizados.

---

## 4. Diferencias de sintaxis entre SGBD

Aunque los conceptos son similares, cada motor utiliza diferentes dialectos y estructuras para implementar estos objetos.

PostgreSQL

PostgreSQL utiliza principalmente PL/pgSQL para implementar funciones y lógica procedural.

Ejemplo simplificado:

CREATE FUNCTION calcular_total(precio NUMERIC, cantidad INTEGER)
RETURNS NUMERIC
AS $$
BEGIN
    RETURN precio * cantidad;
END;
$$ LANGUAGE plpgsql;

MySQL / MariaDB

MySQL y MariaDB utilizan una sintaxis procedural propia para procedimientos, funciones y triggers.

Ejemplo:

```sql
CREATE FUNCTION calcular_total(precio DECIMAL(10,2), cantidad INT)
RETURNS DECIMAL(10,2)
RETURN precio * cantidad;
```

SQL Server

SQL Server utiliza principalmente T-SQL (Transact-SQL).

Ejemplo:


```sql
CREATE FUNCTION calcular_total
(
    @precio DECIMAL(10,2),
    @cantidad INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @precio * @cantidad;
END;
```

Esto demuestra que una misma lógica puede implementarse en diferentes motores, pero la sintaxis no necesariamente es compatible entre ellos.

---

## 5. Manejo de Transacciones

Las transacciones permiten agrupar varias operaciones de una base de datos como una única unidad de trabajo.

Las instrucciones principales son:

COMMIT
ROLLBACK

- "COMMIT": confirma y guarda los cambios realizados.
- "ROLLBACK": deshace los cambios realizados durante la transacción.

Los procedimientos almacenados pueden utilizar transacciones para garantizar que varias operaciones relacionadas se completen correctamente.

Por ejemplo, en una transferencia bancaria se deben realizar dos operaciones:

1. Descontar dinero de una cuenta.
2. Agregar dinero a otra cuenta.

Si la segunda operación falla, sería necesario deshacer también la primera para evitar inconsistencias.

El manejo exacto de transacciones varía entre PostgreSQL, MySQL/MariaDB y SQL Server, por lo que una implementación no siempre puede trasladarse directamente de un motor a otro.

---

## 6. Datos temporales en Triggers

Los triggers necesitan acceder en determinadas situaciones a los valores que tenía un registro antes de una modificación y a los valores que tendrá después.

La forma de acceder a estos datos depende del SGBD.

MySQL y PostgreSQL

En determinados triggers se utilizan referencias como:

OLD
NEW

- "OLD": representa el valor anterior.
- "NEW": representa el nuevo valor.

Por ejemplo, después de modificar el precio de un producto, "OLD.precio" puede representar el precio anterior y "NEW.precio" el nuevo.

SQL Server

SQL Server utiliza tablas lógicas especiales:

INSERTED
DELETED

Estas permiten consultar los registros afectados por operaciones como "INSERT", "UPDATE" y "DELETE".

Por ejemplo, durante un "UPDATE", "DELETED" puede contener los valores anteriores y "INSERTED" los nuevos valores.

---

## 7. Comparación general

| Característica | Procedimiento | Función | Trigger |
|---|---|---|---|
| Ejecución | Manual o desde una aplicación | Como parte de una consulta o llamada | Automática |
| Puede recibir parámetros | Sí | Sí | No de la misma forma |
| Devuelve un valor | No necesariamente | Sí | No |
| Se activa con `INSERT`/`UPDATE`/`DELETE` | No automáticamente | No | Sí |
| Uso principal | Operaciones complejas | Cálculos y reutilización | Automatización y control |
| Puede utilizarse para auditoría | Sí | No es su uso principal | Sí |
| Puede modificar datos | Sí | Depende del SGBD | Sí, según el evento y SGBD |
---

## 8. Ventajas y desventajas

Procedimientos almacenados

Ventajas:

- Centralizan operaciones complejas.
- Pueden reducir la cantidad de consultas enviadas desde la aplicación.
- Permiten controlar operaciones mediante permisos.
- Pueden trabajar con transacciones.

Desventajas:

- Su sintaxis cambia entre SGBD.
- Una gran cantidad de procedimientos puede dificultar el mantenimiento.
- Pueden generar dependencia de un motor específico.

Funciones

Ventajas:

- Permiten reutilizar cálculos.
- Pueden simplificar consultas.
- Centralizan determinadas operaciones.

Desventajas:

- Tienen restricciones diferentes según el SGBD.
- Su uso excesivo puede complicar las consultas.
- Pueden afectar el rendimiento si realizan operaciones costosas repetidamente.

Triggers

Ventajas:

- Se ejecutan automáticamente.
- Son útiles para auditoría.
- Permiten aplicar determinadas reglas de integridad.
- Evitan depender completamente de la aplicación.

Desventajas:

- Pueden dificultar la comprensión del funcionamiento de la base de datos.
- Un trigger mal diseñado puede afectar el rendimiento.
- Los errores pueden ser difíciles de detectar porque la ejecución es automática.
- Su comportamiento puede variar entre diferentes SGBD.
