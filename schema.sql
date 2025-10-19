CREATE TABLE departamento (
    departamento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE ciudad (
    ciudad_id SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(departamento_id)
);

CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50) NOT NULL,
    condiciones_especiales VARCHAR(200),
    ciudad_id INT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudad(ciudad_id)
);

CREATE TABLE servicio (
    servicio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE empleado (
    empleado_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    cargos VARCHAR(200) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (departamento_id) REFERENCES departamento(departamento_id)
);

CREATE TABLE medio_contacto (
    medio_id SERIAL PRIMARY KEY,
    tipo_medio VARCHAR(50) NOT NULL,
    valor_contacto VARCHAR(200) NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE turno (
    turno_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_id INT NOT NULL,
    empleado_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(50) NOT NULL,
    nombre_servicio VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);

CREATE TABLE notificacion (
    notificacion_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    medio_id INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (medio_id) REFERENCES medio_contacto(medio_id)
);
