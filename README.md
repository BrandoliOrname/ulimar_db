# ulimar_db
# Sistema de Gestión de Turnos - Base de Datos PostgreSQL

## Descripción

Este repositorio contiene el esquema y los datos de inicialización para el sistema de gestión de turnos LiMar. La base de datos está diseñada para PostgreSQL y gestiona usuarios, empleados, servicios, turnos y notificaciones.

## Estructura de la Base de Datos

La base de datos consta de 8 tablas principales:

### Tablas Principales

- **departamento**: Almacena los departamentos de la organización
- **ciudad**: Contiene las ciudades y sus códigos postales
- **usuario**: Registra clientes, empleados y proveedores
- **servicio**: Define los servicios disponibles
- **empleado**: Relaciona usuarios con sus roles laborales
- **medio_contacto**: Guarda los medios de contacto de los usuarios
- **turno**: Gestiona las citas y turnos programados
- **notificacion**: Registra las notificaciones enviadas

### Diagrama de Relaciones

```
departamento ──┬─→ ciudad ─→ usuario ──┬─→ medio_contacto
               │                        │
               └─→ empleado ←───────────┘
                      │
                      ↓
                   turno ←─── servicio
                      │
                      ↓
                notificacion
```

## Instalación

### Prerrequisitos

- PostgreSQL 12 o superior
- Cliente de PostgreSQL (psql, pgAdmin, DBeaver, etc.)

### Paso 1: Crear la Base de Datos

```bash
# Conectarse a PostgreSQL
psql -U postgres

# Crear la base de datos
CREATE DATABASE sistema_turnos;

# Conectarse a la base de datos
\c sistema_turnos
```

### Paso 2: Ejecutar el Script de Creación de Tablas

```bash
psql -U postgres -d sistema_turnos -f schema.sql
```

O copiar y ejecutar el contenido de `schema.sql` en tu cliente SQL.

### Paso 3: Cargar los Datos Iniciales

```bash
psql -U postgres -d sistema_turnos -f data.sql
```

## Archivos del Proyecto

```
├── README.md           # Este archivo
├── schema.sql          # Script de creación de tablas
└── data.sql           # Datos de inicialización
```

## Datos de Prueba

La base de datos incluye datos de ejemplo:

- 10 departamentos
- 10 ciudades colombianas
- 12 usuarios (clientes, empleados y proveedores)
- 10 servicios activos
- 10 empleados con diferentes cargos
- 12 medios de contacto
- 10 turnos programados
- 10 notificaciones

## Características Principales

### Auto-incremento con SERIAL

Todas las tablas usan `SERIAL` para la generación automática de IDs:

```sql
CREATE TABLE ejemplo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);
```

### Relaciones y Claves Foráneas

El esquema mantiene integridad referencial mediante claves foráneas:

```sql
FOREIGN KEY (departamento_id) REFERENCES departamento(departamento_id)
```

### Tipos de Datos PostgreSQL

- `SERIAL`: Auto-incremento para IDs
- `VARCHAR(n)`: Cadenas de longitud variable
- `TEXT`: Texto sin límite de longitud
- `DATE`: Fechas (YYYY-MM-DD)
- `TIME`: Horas (HH:MM:SS)
- `TIMESTAMP`: Fecha y hora completa

## Comandos Útiles

### Ver todas las tablas

```sql
\dt
```

### Consultar usuarios por tipo

```sql
SELECT * FROM usuario WHERE tipo_usuario = 'Cliente';
```

### Ver turnos confirmados

```sql
SELECT t.*, u.nombre, u.apellido, s.nombre as servicio
FROM turno t
JOIN usuario u ON t.usuario_id = u.usuario_id
JOIN servicio s ON t.servicio_id = s.servicio_id
WHERE t.estado = 'Confirmado';
```

### Listar empleados por departamento

```sql
SELECT e.cargos, u.nombre, u.apellido, d.nombre as departamento
FROM empleado e
JOIN usuario u ON e.usuario_id = u.usuario_id
JOIN departamento d ON e.departamento_id = d.departamento_id
ORDER BY d.nombre;
```

## Resetear la Base de Datos

Si necesitas eliminar y recrear las tablas:

```sql
-- Eliminar todas las tablas
DROP TABLE IF EXISTS notificacion, turno, medio_contacto, empleado, 
                      usuario, ciudad, servicio, departamento CASCADE;

-- Luego ejecutar nuevamente schema.sql y data.sql
```

##  Notas Importantes

1. **Orden de Ejecución**: Es crucial ejecutar primero `schema.sql` y luego `data.sql`
2. **Dependencias**: Las tablas deben crearse en orden debido a las relaciones de claves foráneas
3. **Migración desde MySQL**: Este esquema fue adaptado de MySQL a PostgreSQL reemplazando:
   - `AUTO_INCREMENT` → `SERIAL`
   - `DATETIME` → `TIMESTAMP`

## Contribuciones

Si deseas contribuir a este proyecto:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request


## Autor

Brandon Alexis Franco Flor

## Contacto

brandon.franco@correounivalle.edu.co

**Última actualización**: Octubre 2025
