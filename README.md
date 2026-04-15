# PawHome Pet Adoption System (DBMS Project)

## About the Project

This project is a **PawHome Pet Adoption System** developed for our DBMS subject as part of the B.Tech Computer Science & Business Systems program at SVKM's NMIMS, Mukesh Patel School of Technology Management & Engineering (A.Y. 2025–26).

The aim of this project is to manage pet adoption activities efficiently using a database-driven approach, integrating adoption management with financial tracking. The system allows users to browse pets, apply for adoption, mark favorites, and track adoption status. Shelters can manage pet listings, and administrators can oversee the system.

The system goes beyond basic adoption management to also handle financial data such as donations, medical records, and operational expenses — enabling data-driven decisions for shelters.

---

## Features

* View available pets for adoption
* Filter pets based on species, age, breed, and other criteria
* View detailed pet information (vaccination status, personality traits, etc.)
* Add pets to favorites / wishlist (heart icon)
* Apply for pet adoption via a structured application form
* Track adoption request status (Pending / Approved / Rejected)
* Application status dashboard
* Manage pet records (Add / Update / Delete)
* Donation tracking system
* Expense tracking per pet
* Medical history management per pet
* Adoption analytics using SQL queries
* Financial insights (total donations, expenses, costs per pet)
* Store user and adoption details in a relational database
* Interactive frontend with dynamic filtering and UI elements
* Responsive user interface across devices

---

## Technologies Used

* **Frontend:** HTML5, CSS3, JavaScript
* **Database:** MySQL (MySQL Workbench)
* **ER Diagram Design:** Draw.io
* **Backend:** Frontend-based logic (SQL)(backend integration can be added)

---

## Database Design

### Entities

The system consists of the following entities:

* **USER** — stores adopter information
* **PET** — stores pet details
* **SHELTER** — stores shelter information
* **ADOPTION\_REQUEST** — tracks adoption applications
* **FAVORITES** — stores user wishlist data
* **DONATION** — tracks user donations
* **MEDICAL\_RECORD** — stores pet treatment details
* **EXPENSE** — tracks operational costs per pet

### Key Relationships

* USER ↔ PET via ADOPTION\_REQUEST (Many-to-Many)
* USER ↔ PET via FAVORITES (Many-to-Many)
* SHELTER → PET (One-to-Many)
* USER → DONATION (One-to-Many)
* PET → MEDICAL\_RECORD (One-to-Many)
* PET → EXPENSE (One-to-Many)

### Normalization

The database is normalized up to **Third Normal Form (3NF)**:

* **1NF** — All attributes are atomic; no repeating groups
* **2NF** — No partial dependencies; separate tables for USER, PET, SHELTER
* **3NF** — No transitive dependencies; independent tables for financial and operational data

---

## Advanced SQL Features

* Views — simplified data retrieval
* Complex Joins (INNER JOIN, LEFT JOIN, FULL OUTER JOIN simulation)
* Subqueries and Aggregation

---

## How to Run the Project

1. Install MySQL and open MySQL Workbench
2. Create and use the database:
   ```sql
   CREATE DATABASE petadoption;
   USE petadoption;
   ```
3. Run the SQL file containing table creation and insert queries
4. Open the HTML file (`pet-adoption.html`) in any web browser
5. Interact with the system (browse pets, filter, apply for adoption, etc.)

---

## Folder Structure

```
├── frontend/         → contains HTML file (pet-adoption.html)
├── database/         → contains SQL queries (tables + sample data)
└── README.md         → project documentation
```

---

## Notes

* The project runs locally (not hosted online)
* Database used is MySQL (`petadoption`)
* Frontend is interactive using JavaScript
* Backend integration can be added for full stack functionality

---

## What We Learned

* Designing relational database schemas
* Creating ER diagrams and relational models
* Writing SQL queries (joins, subqueries, aggregation, etc.)
* Implementing normalization techniques (1NF, 2NF, 3NF)
* Understanding foreign key constraints and referential integrity
* Applying advanced SQL concepts: views, joins etc.
* Query optimization using efficient joins
* Integrating financial database concepts (donations, expenses, medical records)
* Connecting frontend logic with database concepts
* Building interactive and responsive UI using HTML, CSS, and JavaScript
* Understanding real-world DBMS applications

---

## Submitted By

| Roll No. | Name | Contribution |
|----------|------|-------------|
| B042 | Prisha Mistry | Frontend, README file, final project report, SQL |
| B057 | Daneeka Roy | Designing schema and relationships, ER diagram, SQL |
| B058 | Harshvardhan Sahi | Designing schema and relationships, ER diagram, SQL |

**Course:** Database Management Systems · **Semester:** IV · **A.Y.:** 2025–26

---

## GitHub Link

[https://github.com/priisha26/PETADOPTION.git](https://github.com/priisha26/PETADOPTION.git)

---

## License

This project is created for academic purposes and follows standard educational use guidelines.
