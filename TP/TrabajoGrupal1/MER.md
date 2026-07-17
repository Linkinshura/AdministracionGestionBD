## Persona:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| DNI | VARCHAR | 8 | PK | - |
| Nombre | VARCHAR | 20 | - | - |
| Apellido | VARCHAR | 20 | - | - |
| Telefono | VARCHAR | 8 | - | - | 
| Email | VARCHAR | 40 | - | - |

## Socio:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Carnet | INT | 0-999 | PK | - |
| Estado |  VARCHAR | 10 | - | - |

## Actividad:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Id | INT | 0-999 | PK | - |
| Descripcion | VARCHAR | 80 | - | - |
| Nombre | VARCHAR | 40 | - | - |

## Profesor:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Legajo | INT | 0-999 | PK | - |
| Sueldo | VARCHAR | 20 | - | - |

## Clase:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Id | INT | 0-999 | PK | - |
| Horario | TIME | -838:59:59  838:59:59 | 
| Dia | DATE | 1000-01-01 - 9999-12-31 | - | - |

## Salon:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Id | INT | 0-999 | PK | - |
| Nombre | VARCHAR | 50 | - | - |
| Capacidad | INT | 0-999 | - | - |

## FichaMedica:
| Atributo | TipoDato | Dominio |  Clave | TablaForanea |
| :-: | :-: | :-: | :-: | :-: |
| Id | INT | 0-999 | PK | - |
| CargaPermitida | VARCHAR | 50 | - | - |
| Observaciones | VARCHAR | 120 | - | - |
