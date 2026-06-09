---
title: "Mental Health Support Platform — Database Design"
summary: "Designed and normalized a relational database (to 3NF) for a mental-health platform: 7 tables, role-based access, built in SQL Server."
category: "Data Systems"
date: "Aug 2025"
tags: ["SQL Server", "SSMS", "Database Design", "Normalization", "ER Modeling", "Draw.io"]
cover: "/projects/mental-health-1.png"
repo: ""        # TODO: push the .sql + docs to a repo and link it here
featured: true
order: 4
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

## Why it matters

Models are only as good as the data feeding them. Normalizing to 3NF kills the
redundancy and update anomalies that quietly corrupt analysis later — this is the
unglamorous groundwork that makes trustworthy data science possible, and the half of
the job that decides whether the modeling is worth anything.
