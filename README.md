# ExamPortal - Online Examination Platform

ExamPortal is a web-based online examination platform developed as a Dynamic Web Application. It provides an easy way for students to register, log in, attempt online examinations, and view their examination results.

The application also provides an Admin Panel for managing examination categories, sections, tests, questions, students, and examination reports.

---

## Project Overview

ExamPortal helps convert traditional pen-and-paper examinations into an online examination system.

Students can access the platform through a web browser using a desktop, laptop, or mobile device.

The system provides online examination management, automatic result generation, examination reports, and certificate-related functionality.

---

## Technologies Used

### Front-End
- HTML
- CSS
- JavaScript
- JSP
- Bootstrap

### Back-End
- Java
- Servlet
- JDBC
- MySQL

### Architecture / Design
- MVC-based Web Application
- DAO Pattern
- Singleton Pattern

### Server
- Apache Tomcat

### Development Environment
- Eclipse IDE

---

## Main Features

### Student Module

- Student Registration
- Student Login
- Student Profile
- Change Password
- Browse Examination Categories
- View Available Exams
- View Upcoming Exams
- Practice Tests
- Online Mock Tests
- Random Question Selection
- Timer-Based Examination
- Automatic Examination Submission
- Automatic Result Generation
- Result Analysis
- Performance Report
- Certificate of Achievement

---

## Examination System

The examination module provides an online environment where students can attempt tests.

### Random Questions

Questions can be selected randomly for an examination using Java collection functionality.

This helps provide a different question sequence during examinations.

### Timer-Based Examination

The examination includes a JavaScript-based timer.

When the examination time expires, the examination can be submitted automatically without requiring manual intervention.

### Automatic Result

After submitting an examination, the system calculates the result and displays the student's performance.

The result can include information such as:

- Test Name
- Test Type
- Subject
- Total Marks
- Marks Obtained
- Total Attempted Questions
- Grade
- Rank
- Percentile
- Accuracy
- Performance Analysis

---

## Admin Module

The Admin Panel allows administrators to manage the examination system.

### Admin Features

- Admin Login
- Admin Dashboard
- Manage Categories
- Manage Sections
- Manage Tests
- Manage Questions
- Manage Students
- Manage Examination Data
- View Results
- Generate Reports

---

## CRUD Operations

The application implements CRUD operations for managing application data.

CRUD stands for:

- Create
- Read
- Update
- Delete

These operations are implemented using Java, Servlet, JDBC, and the DAO pattern.

---

## DAO Pattern

The project uses the Data Access Object (DAO) pattern to separate database-related operations from application logic.

DAO classes are responsible for performing database operations using JDBC.

This helps keep the application code organized and maintainable.

---

## Database

The application uses MySQL as the database.

Database-related operations are performed through JDBC.

The application contains separate DAO and implementation classes for different modules such as:

- Student
- Admin
- Category
- Exam
- Test
- Question
- Result
- Section
- Blog
- Assignment
- Study Material

---

## Application Modules

### Student Side

The student side provides:

- Home
- Registration
- Login
- Exams
- Practice Tests
- Resources
- Study Material
- Question Bank
- Interview Preparation
- Placement
- Results
- Profile
- Change Password

### Admin Side

The admin side provides:

- Dashboard
- Category Management
- Section Management
- Test Management
- Question Management
- Student Management
- Result Management
- Report Generation

---

## Project Structure

```text
ExamPortal
│
├── src
│   └── com.examhub
│       ├── dao
│       ├── impl
│       ├── pojo
│       ├── test
│       └── utility
│
├── WebContent
│   ├── assets
│   ├── assets1
│   ├── WEB-INF
│   ├── JSP Pages
│   └── CSS / JavaScript files
│
├── examhub.sql
├── README.md
└── Eclipse Project Configuration