# Vajira Constructions — OOP \& DM

Two coursework projects built around a shared theme: a database and a desktop application for a construction company called **"Vajira Constructions."**

## Contents

* **Database Management** coursework
* **Object Oriented Programming** coursework

\---

## DM — Database Management

[vajira-constructions.sql`](./DM/vajira-constructions.sql)

A SQL script that builds out the company's database: tables for departments, employees, managers, customers, projects, tasks, suppliers, and materials, along with sample data, queries, and role-based user permissions.

## OOP — Object Oriented Programming

[VajiraConstructions.java`](./OOP/VajiraConstructions.java)

A Java Swing desktop application modeling customer and employee interactions with the company's project/order workflow.

**Class structure:**

|Class|Type|Description|
|-|-|-|
|`Person`|Abstract class|Base class holding shared `name` and `ID` attributes|
|`Customer`|extends `Person`|Places orders; tracks a list of `Order`s|
|`Employee`|extends `Person`|Views assigned orders/tasks|
|`Order`|Standalone class|Represents a project order (name, deadline, budget, design, rooms)|
|`VajiraConstructions`|extends `JFrame`, implements `ActionListener`|Main GUI application — login, menus, and panels for placing orders, viewing orders, past projects, and tasks|

**Features:** role-based login (Customer/Employee), placing a new order, viewing submitted orders, viewing completed projects, and viewing employee tasks.

**Running the program:**

```bash
javac VajiraConstructions.java
java VajiraConstructions
```

Demo login — Customer: `Sithumini` / `custSithumini`, Employee: `John` / `empJohn`

