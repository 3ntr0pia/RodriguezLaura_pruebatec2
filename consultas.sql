create database gestorturnos;
use gestorturnos;

## Ejecutar la aplicación para la creación de tablas

## Inserccion de datos de prueba 
INSERT INTO ciudadano (DNI, APELLIDOS, DIRECCION, NOMBRE, TELEFONO) VALUES
('12345678A', 'García López', 'Calle Mayor 10', 'Juan', '600123456'),
('87654321B', 'Martínez Pérez', 'Avenida Sol 5', 'María', '600987654'),
('11223344C', 'Fernández Ruiz', 'Plaza Luna 8', 'Carlos', '600654321'),
('99887766D', 'Hernández Gómez', 'Calle Río 3', 'Ana', '600321654'),
('44556677E', 'López Sánchez', 'Avenida Mar 12', 'Elena', '600789012'),
('55443322F', 'Jiménez Torres', 'Calle Bosque 7', 'Luis', '600456789');

-- Inserción de registros en la tabla turno
INSERT INTO turno (ID, DESCRIPCION, ESTADO, FECHA, NUMERO, ciudadano_dni) VALUES
(1, 'Consulta médica', 0, '2025-01-14', 101, '12345678A'),
(2, 'Renovación de documentos', 1, '2025-01-13', 102, '87654321B'), 
(3, 'Solicitud de certificado', 0, '2025-01-14', 103, '11223344C'), 
(4, 'Cambio de dirección', 0, '2025-01-12', 104, '99887766D'),
(5, 'Inscripción en padrón', 1, '2025-01-10', 105, '44556677E'), 
(6, 'Consulta sobre impuestos', 0, '2025-01-15', 106, '55443322F'); 