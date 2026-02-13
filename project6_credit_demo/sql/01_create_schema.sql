-- CREATE DATABASE credito_demo;

-- Tabla de clientes
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    income_monthly NUMERIC(10,2),
    employment_status VARCHAR(30)
);

-- Tabla de créditos
CREATE TABLE loan (
    loan_id INT PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    amount NUMERIC(12,2),
    interest_rate NUMERIC(5,2),
    term_months INT,
    start_date DATE,
    status VARCHAR(20) CHECK (status IN ('VIGENTE','CANCELADO','MOROSO'))
);

-- Tabla de pagos (opcional para detalle)
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    loan_id INT REFERENCES loan(loan_id),
    payment_date DATE,
    amount NUMERIC(12,2)
);