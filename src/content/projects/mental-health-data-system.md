---
title: "Mental Health Support Platform — Database Design"
summary: "Designed and normalized a relational database (to 3NF) for a mental-health platform: 7 tables, role-based access, built in SQL Server."
category: "Data Systems"
date: "Aug 2025"
tags: ["SQL Server", "SSMS", "Database Design", "Normalization", "ER Modeling", "Draw.io"]
cover: "/projects/mental-health-1.png"
sql: "/files/mental-health-schema.sql"
repo: "https://github.com/haji1593/mental-health-database"
featured: true
order: 3
draft: false
---

## The problem

A mental-health support platform needs to store sensitive data — therapy sessions,
wellness check-ins, feedback, and payments — **securely, without redundancy, and in a
way analytics can trust**. That starts with the database. As a team, we designed the
relational foundation from raw input all the way to a clean, normalized schema.

## What I built

**1 · From raw data to a schema.** Real input was collected via Google Forms as an
**Unnormalized Form (UNF)**, then taken through **1NF → 2NF → 3NF** to remove
repeating groups, partial dependencies, and transitive dependencies.

**2 · Entity-relationship modeling.** A Chen-style **ER diagram** (Draw.io) mapped the
entities and their relationships — including a **ternary relationship** between
*Patients, Sessions, and Payments* that a simple binary relationship couldn't capture.

**3 · The relational database.** Built in **SQL Server (SSMS)** with primary/foreign
keys and constraints across seven tables:

- **Patients**, **Therapists**, **Sessions**, **Feedback**, **Wellness_Progress**,
  **Medical_Records**, and **Payments**.

**4 · Role-based access.** Distinct workflows and permissions for patients, therapists,
administrators, cashiers, and medical-records staff — so each role touches only the
data it should.

## The schema (SQL Server)

Built in SSMS with primary keys and foreign-key constraints tying every record back
to a patient or session:

```sql
CREATE TABLE Patients (
    Patient_id INT PRIMARY KEY,
    PFName VARCHAR(50) NOT NULL,
    PLName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    Phone_number INT,
    Home_address VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Registration_date DATE NOT NULL
);

CREATE TABLE Therapists (
    TherapistID INT PRIMARY KEY,
    TFName VARCHAR(100) NOT NULL,
    TLName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Email VARCHAR(50)
);

CREATE TABLE TSession (
    TsessionID INT PRIMARY KEY,
    Patient_id INT,
    TherapistID INT,
    SessionDate DATE,
    Duration INT NOT NULL,
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY (TherapistID) REFERENCES Therapists(TherapistID)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    Patient_id INT,
    TsessionID INT,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(100),
    payment_date DATE NOT NULL,
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY (TsessionID) REFERENCES TSession(TsessionID)
);
```

On top of the schema I wrote the queries that make the data useful — **inner/left/right/full
joins** across patients and sessions, **subqueries** to find therapists tied to
below-average payments, and **aggregates** for wellness trends. The full script
(schema + `Feedbacks`, `Progress`, `Records` tables + all queries) is one download away.

## Why it matters

Models are only as good as the data feeding them. Normalizing to 3NF kills the
redundancy and update anomalies that quietly corrupt analysis later — this is the
unglamorous groundwork that makes trustworthy data science possible, and the half of
the job that decides whether the modeling is worth anything.
