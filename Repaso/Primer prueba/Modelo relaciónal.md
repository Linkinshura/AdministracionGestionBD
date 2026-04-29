# Modelo Relacional

## Conceptos básicos

### Tabla (Relación)
Estructura donde se almacenan los datos.

### Fila (Tupla)
Registro individual dentro de una tabla.

### Columna (Atributo)
Característica de los datos.

## Claves

### Clave Primaria (PK)
- Identifica un registro único
- No se repite
- No puede ser nula

### Clave Foránea (FK)
- Relaciona tablas entre sí
- Apunta a una PK de otra tabla

## Integridad

### Integridad de Entidad
- No puede haber claves primarias nulas

### Integridad Referencial
- Las claves foráneas deben existir en la tabla relacionada

## Relaciones

Tipos:
- Uno a uno (1:1)
- Uno a muchos (1:N)
- Muchos a muchos (N:M)

## Diseño de Base de Datos

### Etapas
1. Modelo conceptual (ER)
2. Modelo lógico
3. Modelo físico

## Diagrama Entidad-Relación (ER)

Elementos:
- Entidades
- Atributos
- Relaciones

## Normalización

Proceso para evitar redundancia.

### Formas normales
- 1FN: sin datos repetidos
- 2FN: dependencia completa de la PK
- 3FN: sin dependencias transitivas

## Beneficios
- Evita duplicación
- Mejora integridad
- Optimiza almacenamiento