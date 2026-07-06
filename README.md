# TechCare Solutions Riwi S.A.S. — Relational Database Project

**Developer:** Isaac Guzman
**Clan:** Cumbia
**Database name:** `bd_isaac_guzman_cumbia`

## 1. Project description

TechCare Solutions Riwi S.A.S. provides preventive and corrective maintenance
services for technology equipment across multiple cities in Colombia. All
operational information (clients, technicians, equipment, services and
branches) was previously kept in a single shared Excel file, which caused
duplicated clients, duplicated technicians, inconsistent equipment/city
names, and unreliable reports.

## 2. Technologies used

- MySQL 
- MySQL Workbench


## 3. Normalization process

**1NF (atomicity, no repeating groups):**
Every attribute already held a single value per row and there were no
repeating groups, so the data satisfied 1NF once each concept (city,
branch, client, technician, equipment, category, service type, work order)
was represented in its own table with an atomic value per column.

**2NF (no partial dependency on a composite key):**
All tables use a single-column surrogate primary key (`id_riwi_*`), so there
are no composite keys and therefore no partial-dependency violations.
Attributes such as `category_name` were kept out of `riwi_equipment` and
moved into their own `riwi_equipment_category` table, since the category
name only depends on the category, not on each individual equipment row.

**3NF (no transitive dependency):**
- `branch_name` depended on `city_name`, not on the client, so a `riwi_branch`
  table was created, referencing `riwi_city` by `id_riwi_city` — this removes
  the transitive dependency `client -> branch -> city` that existed when the
  city name was stored directly next to the client.
- `service_type_name` and `category_name` were extracted into their own
  catalog tables for the same reason (they don't depend on the work order or
  the equipment row itself, only on the type/category they represent).
- In `riwi_work_order`, the city/branch of a service is now obtained
  transitively through `riwi_client -> riwi_branch -> riwi_city`, instead of
  being duplicated as a column in the work order. This guarantees that every
  non-key attribute depends only on the primary key of its own table.


## 4. Entity Relationship Diagram

Relationships (all 1:N):
`riwi_city (1) — (N) riwi_branch`
`riwi_branch (1) — (N) riwi_client`
`riwi_equipment_category (1) — (N) riwi_equipment`
`riwi_technician (1) — (N) riwi_work_order`
`riwi_client (1) — (N) riwi_work_order`
`riwi_equipment (1) — (N) riwi_work_order`
`riwi_service_type (1) — (N) riwi_work_order`

## 5. Database creation instructions

```bash
mysql -u root -p < script dll.sql
```

This creates the database `bd_isaac_guzman_cumbia` and all 8 tables with
their primary keys, foreign keys, `NOT NULL`, `UNIQUE` and `CHECK`
constraints.

## 6. Data loading instructions

```bash
mysql -u root -p < script insert datos.sql
```

Loads all catalog data and the 20 work orders described in section 6.

## 7. DML scripts

```bash
mysql -u root -p < script dml.sql
```

Contains:
- **Insert:** a new client together with a new service order (wrapped in a
  transaction, using `LAST_INSERT_ID()` to link them).
- **Update:** update of an existing technician's data.
- **Delete:** deletion of an equipment with no associated orders.

## 8. Business queries 

1. **Orders per technician** — supports workload balancing across the team.
2. **Service history by city** — shows which cities generate the most
   technical services.
3. **Total services by service type** — identifies the most requested
   service types and their total cost.
4. **Equipment with the most maintenances** — highlights equipment requiring
   the most technical attention.
5. **Clients with the most service orders** — supports loyalty/retention
   strategy for high-demand clients.
6. **Orders managed per branch** — shows operational load per branch to help
   plan staff and resources.

## 9. Repository structure

```
├── README.md
├── Dataset_TechCareSolutions_jonada_intermedia.xlsx   (original file)
├── script ddl.sql
├── script dml.sql
├── script insert datos.sql
└── script queries.sql
```

## 10. Developer information

- **Full name:** Isaac Guzman
- **Clan:** Cumbia