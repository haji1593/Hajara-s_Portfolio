---
title: "Bike-Share Time Intelligence Dashboard"
summary: "Power BI dashboard over 55K bike trips with full time-intelligence: YoY / QoQ / MoM growth, seasonality, and bike-type mix."
category: "Power BI"
date: "2025"
tags: ["Power BI", "DAX", "Time Intelligence", "Data Modeling"]
cover: "/projects/bike-1.png"
gallery: ["/projects/bike-1.png", "/projects/bike-2.png"]
repo: ""        # TODO: link the .pbix / repo if you publish it
demo: ""
featured: true
order: 2
draft: false
---

## The question

A bike-share operator sits on years of trip logs but can't see the story in them:
**Is ridership growing or shrinking? When does demand peak? Who rides electric vs
standard — and is that changing?** I built a Power BI dashboard to answer all of
it on one screen.

## The build

**Data model + DAX time intelligence.** The heart of this project is a set of
calculated measures comparing each period against its own history — **prior
quarter, prior year, and prior month** (`Trip_PQ`, `Trip_PY`, `Trip_PM`) — plus a
`Trip Growth` measure. Getting these right means a clean date table and correct
`CALCULATE` / `DATEADD` logic, not just dropping fields on a chart.

**Interactive exploration.** Slicers for day, month, year, bike type, station, and
user type let a manager answer their own follow-up questions without a new report.

## What it shows

- **55K total trips**, **341K** total distance, average trip duration **39.4 min**.
- **Seasonality is dramatic:** ridership more than doubles from a February low
  (~2.6K) to a summer peak (~6.5K in May–August), then falls off into winter.
- **Bike-type mix:** **75% standard / 25% electric** — a clear baseline to track
  as the electric fleet grows.
- **Weekday demand is remarkably flat** (7.7K–7.9K/day), so capacity planning can't
  lean on a "weekend rush" assumption.
- A **−41 trip-growth** signal flags a period of decline worth investigating.

## Why it matters

This is operational analytics done properly: not just *what happened*, but *how it
compares* — which is exactly what time-intelligence DAX delivers and what turns a
chart into a planning tool.
