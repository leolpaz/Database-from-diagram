CREATE DATABASE medical_db;

CREATE TABLE patients (
    id INT GENERATED AlWAYS AS IDENTITY, 
    name VARCHAR(250),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED AlWAYS AS IDENTITY, 
    admitted_at TIMESTAMP,
    status VARCHAR(250),
    patient_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)

);

CREATE TABLE invoices (
    id INT GENERATED AlWAYS AS IDENTITY, 
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)

);