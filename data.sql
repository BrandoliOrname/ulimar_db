INSERT INTO departamento (nombre, descripcion) VALUES
('Atención al Cliente', 'Departamento encargado de la atención directa a clientes'),
('Logística', 'Departamento de despacho y recepción de mercancías'),
('Consultoría', 'Departamento de asesoría y consultoría'),
('Administración', 'Departamento administrativo y de gestión'),
('Ventas', 'Departamento de ventas y comercialización'),
('Recursos Humanos', 'Departamento de gestión de personal'),
('Sistemas', 'Departamento de tecnología e informática'),
('Contabilidad', 'Departamento financiero y contable'),
('Marketing', 'Departamento de marketing y publicidad'),
('Calidad', 'Departamento de control de calidad');

INSERT INTO ciudad (nombre_ciudad, codigo_postal, departamento_id) VALUES
('Cali', '760001', 1),
('Bogotá', '110111', 2),
('Medellín', '050001', 3),
('Barranquilla', '080001', 4),
('Cartagena', '130001', 5),
('Bucaramanga', '680001', 6),
('Pereira', '660001', 7),
('Santa Marta', '470001', 8),
('Cúcuta', '540001', 9),
('Manizales', '170001', 10);

INSERT INTO usuario (nombre, apellido, tipo_usuario, condiciones_especiales, ciudad_id) VALUES
('María', 'González', 'Cliente', 'Embarazo', 1),
('Juan', 'Pérez', 'Cliente', 'Adulto Mayor', 2),
('Carlos', 'Ramírez', 'Empleado', NULL, 1),
('Ana', 'Martínez', 'Cliente', 'Silla de Ruedas', 3),
('Luis', 'Hernández', 'Proveedor', NULL, 4),
('Carmen', 'López', 'Cliente', NULL, 5),
('Pedro', 'García', 'Empleado', NULL, 2),
('Laura', 'Rodríguez', 'Cliente', 'Embarazo', 6),
('Miguel', 'Sánchez', 'Cliente', NULL, 7),
('Isabel', 'Torres', 'Cliente', 'Adulto Mayor', 8),
('Roberto', 'Díaz', 'Empleado', NULL, 3),
('Sofía', 'Vargas', 'Cliente', NULL, 9);

INSERT INTO servicio (nombre, descripcion, estado) VALUES
('Despacho de Mercancía', 'Servicio de despacho y envío de productos', 'Activo'),
('Recepción de Artículos', 'Servicio de recepción y registro de artículos', 'Activo'),
('Atención al Cliente', 'Servicio de información y atención personalizada', 'Activo'),
('Consultoría General', 'Servicio de asesoría y consultoría empresarial', 'Activo'),
('Entrega a Domicilio', 'Servicio de entrega directa al domicilio', 'Activo'),
('Consultoría Especializada', 'Servicio de consultoría en áreas específicas', 'Activo'),
('Reclamaciones', 'Servicio de gestión de quejas y reclamaciones', 'Activo'),
('Devoluciones', 'Servicio de devolución de productos', 'Activo'),
('Cotizaciones', 'Servicio de solicitud de cotizaciones', 'Activo'),
('Soporte Técnico', 'Servicio de asistencia técnica', 'Activo');

INSERT INTO empleado (usuario_id, cargos, departamento_id) VALUES
(3, 'Asesor de Atención', 1),
(7, 'Coordinador de Logística', 2),
(11, 'Consultor Senior', 3),
(3, 'Auxiliar Administrativo', 4),
(7, 'Ejecutivo de Ventas', 5),
(11, 'Analista de RRHH', 6),
(3, 'Desarrollador', 7),
(7, 'Contador', 8),
(11, 'Especialista en Marketing', 9),
(3, 'Auditor de Calidad', 10);

INSERT INTO medio_contacto (tipo_medio, valor_contacto, usuario_id) VALUES
('Correo', 'maria.gonzalez@email.com', 1),
('Teléfono', '+57 300 1234567', 1),
('SMS', '+57 300 1234567', 1),
('Correo', 'juan.perez@email.com', 2),
('Teléfono', '+57 310 2345678', 2),
('Correo', 'ana.martinez@email.com', 4),
('Teléfono', '+57 320 3456789', 4),
('Correo', 'luis.hernandez@email.com', 5),
('Correo', 'carmen.lopez@email.com', 6),
('Teléfono', '+57 315 4567890', 6),
('Correo', 'laura.rodriguez@email.com', 8),
('SMS', '+57 316 5678901', 8);

INSERT INTO turno (usuario_id, servicio_id, empleado_id, fecha, hora_inicio, hora_fin, estado, nombre_servicio) VALUES
(1, 1, 1, '2025-10-20', '09:00:00', '09:30:00', 'Confirmado', 'Despacho de Mercancía'),
(2, 3, 2, '2025-10-20', '10:00:00', '10:30:00', 'Pendiente', 'Atención al Cliente'),
(4, 2, 3, '2025-10-21', '11:00:00', '11:45:00', 'Confirmado', 'Recepción de Artículos'),
(6, 4, 1, '2025-10-21', '14:00:00', '15:00:00', 'Confirmado', 'Consultoría General'),
(8, 5, 2, '2025-10-22', '09:30:00', '10:00:00', 'Pendiente', 'Entrega a Domicilio'),
(9, 7, 4, '2025-10-22', '15:00:00', '15:30:00', 'Confirmado', 'Reclamaciones'),
(1, 8, 5, '2025-10-23', '08:00:00', '08:45:00', 'Atendido', 'Devoluciones'),
(2, 9, 6, '2025-10-23', '16:00:00', '16:30:00', 'Confirmado', 'Cotizaciones'),
(4, 10, 7, '2025-10-24', '10:30:00', '11:15:00', 'Pendiente', 'Soporte Técnico'),
(6, 3, 8, '2025-10-24', '13:00:00', '13:30:00', 'Cancelado', 'Atención al Cliente');

INSERT INTO notificacion (usuario_id, medio_id, mensaje, fecha_envio, estado) VALUES
(1, 1, 'Su turno ha sido confirmado para el 20/10/2025 a las 09:00', '2025-10-18 14:30:00', 'Enviada'),
(1, 2, 'Recordatorio: Turno mañana 09:00 - Despacho de Mercancía', '2025-10-19 18:00:00', 'Enviada'),
(2, 4, 'Bienvenido al sistema de turnos LiMar', '2025-10-17 10:00:00', 'Enviada'),
(4, 6, 'Su turno ha sido agendado para el 21/10/2025 a las 11:00', '2025-10-18 15:45:00', 'Enviada'),
(6, 9, 'Confirmación de turno - Consultoría General', '2025-10-19 09:30:00', 'Enviada'),
(8, 11, 'Su solicitud de turno está pendiente de confirmación', '2025-10-20 11:00:00', 'Enviada'),
(9, 6, 'Turno confirmado exitosamente', '2025-10-20 13:20:00', 'Enviada'),
(1, 3, 'Su turno ha sido atendido. Gracias por usar nuestros servicios', '2025-10-23 08:50:00', 'Enviada'),
(2, 5, 'Recordatorio: Tiene un turno programado para mañana', '2025-10-22 17:00:00', 'Enviada'),
(4, 7, 'Importante: Verifique los requisitos para su turno', '2025-10-23 09:15:00', 'Enviada');
