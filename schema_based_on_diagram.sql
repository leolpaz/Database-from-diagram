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

CREATE TABLE treatments (
  id INT GENERATED AlWAYS AS IDENTITY,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
  id INT GENERATED AlWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE TABLE treatment_medical_history (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON treatment_medical_history (treatment_id);
CREATE INDEX ON treatment_medical_history (medical_history_id);
