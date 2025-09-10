
-- Eliminar tablas si ya existen, en el orden correcto
DROP TABLE IF EXISTS complaint CASCADE;
DROP TABLE IF EXISTS right_type CASCADE;
DROP TABLE IF EXISTS municipality CASCADE;
DROP TABLE IF EXISTS area_responsible CASCADE;

-- ==============================================
-- CREACIÓN DEL ESQUEMA DE TABLAS
-- ==============================================

-- Tabla de tipos de derecho humano
CREATE TABLE right_type (
    right_id INT PRIMARY KEY,
    right_name VARCHAR(150) NOT NULL
);

-- Tabla de municipios
CREATE TABLE municipality (
    mun_id INT PRIMARY KEY,
    mun_name VARCHAR(150) NOT NULL
);

-- Tabla de áreas responsables
CREATE TABLE area_responsible (
    area_id INT PRIMARY KEY,
    area_name VARCHAR(150) NOT NULL
);

-- Tabla de quejas principales
CREATE TABLE complaint (
    complaint_id INT PRIMARY KEY,
    received_date DATE NOT NULL,
    right_id INT REFERENCES right_type(right_id),
    mun_id INT REFERENCES municipality(mun_id),
    area_id INT REFERENCES area_responsible(area_id),
    status VARCHAR(20) CHECK (status IN ('ABIERTO','EN PROCESO','CERRADO')),
    description TEXT
);

-- Coordenadas de los municipios
CREATE TABLE municipality_coordinates (
    mun_id INT PRIMARY KEY,
    mun_name VARCHAR(100),
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6)
);

INSERT INTO municipality_coordinates (mun_id, mun_name, latitud, longitud) VALUES
(1, 'León', 21.125000, -101.684000),
(2, 'Irapuato', 20.676600, -101.356300),
(3, 'Salamanca', 20.572000, -101.197000),
(4, 'Celaya', 20.523500, -100.815000),
(5, 'Guanajuato', 21.019000, -101.257400),
(6, 'Dolores Hidalgo', 21.156100, -100.932100),
(7, 'San Miguel de Allende', 20.914000, -100.743000);