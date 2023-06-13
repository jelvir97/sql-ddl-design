DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    dr_name text   NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name text   NOT NULL
);

CREATE TABLE doctor_patient (
    id SERIAL PRIMARY KEY,
    dr_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    disease text
);