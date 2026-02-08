## 🏫 School Management System (Java Swing Mini Project)

The School Management System is a beginner-friendly Java Swing GUI-based mini project developed to understand the fundamentals of:

* Java Swing (GUI development)
* Object-Oriented Programming (OOP)
* Basic service-layer architecture
* Event handling and user interaction

This project simulates a simple school/college management system where users can manage students, teachers, and fee payments through a graphical interface.

---

## 🎯 Objectives

* Learn how to build desktop applications using Java Swing
* Understand package-based project structure (GUI, Model, Service)
* Practice OOP concepts like classes, objects, inheritance, polymorphism and encapsulation
* Create a real-world inspired academic management system

---

## 🧩 Features

**🔐 Login & Registration**

* Login window for users
* Registration option for new students or teachers

**🧑‍🎓 Student Management**

* Add new students
* View the list of students
* Display student details (Id, Name, Age, Roll No, Department, Marks)

**👩‍🏫 Teacher Management**

* Add teacher details
* View teacher list
* Display Student details (Name, Subject Assigned)

**💰 Fee Payment System**
* Add fee payment records
* View fee-related information

**📊 Dashboard**

* Central dashboard to navigate between modules
* Buttons to access Student, Teacher, and Fee modules

---

## 🗂️ Project Structure

School_Management_System/
---
└── src/
---
     └── School_Management_System
            ├── Main
            |    └── MainApp.java
            |
            ├── GUI/
            │     └── SchoolGUI.java
            ├── Window/
            │     ├── LoginWindow.java
            │     ├── RegisterWindow.java
            │     └── DashboardWindow.java
            ├── Forms/ 
            │     ├── StudentForm.java
            │     ├── TeacherForm.java
            │     ├── FeePaymentForm.java
            │
            ├── Model/
            |     ├── Person.java
            │     ├── Student.java
            │     ├── Teacher.java
            │     ├── User.java
            |     ├── Course.java
            |     ├── Enrollment.java
            |     └── Grade.java
            │
            ├── Service/
            |       ├── SchoolService.java
            |       ├── StudentService.java
            |       ├── CourseService.java
            |       ├── EnrollmentService.java
            |       ├── GradeService.java
            |       └── ResultService.java
            | 
            ├── Exception/
            |       ├── OperationFailedException.java
            |       ├── DataNotFoundException.java
            |       ├── DuplicateRecordException.java
            |       └── InvalidInputException.java
            |
            ├── Panels/
            |       ├── StudentPanel.java
            |       ├── TeacherPanel.java
            |       ├── AdminPanel.java
            |       ├── CoursePanel.java
            |       └── LoginPanel.java
            |
            ├── Data/
            |       └── DataStore.java
            |
            ├── DataBase_Connection/
            |       └── DBConnection.java
            |
            ├── Widgets/
            |       └── EntityTableModel.java
            |
            └── Util/
                    ├── Constants.java
                    └── ValidationUtil.java

---

## 🛠️ Technologies Used

* Java (JDK 8 or above)
* Java Swing for GUI
* AWT for layouts and events
* IDE: Eclipse / IntelliJ IDEA / NetBeans / Vs Code

---

## ▶️ How to Run the Project

* Clone or download the project
* Open it in your Java IDE
* Ensure JDK is properly configured
* Run the main class (e.g., SchoolGUI or LoginWindow)
* The GUI window will appear

---

## 📚 Learning Outcomes

* Hands-on experience with Java Swing
* Clear understanding of GUI + Service separation
* Improved debugging skills (type mismatch, getters/setters, packages)
* Foundation for advanced projects (Database, JDBC, JavaFX)

---

## 🚀 Future Enhancements

* Database integration using MySQL + JDBC
* Role-based access (Admin / Teacher / Student)
* Attendance management
* Report generation
* Improved UI design

---

## 🎓 Author

Aaisha Jha
BCS.IT (Cyber Security & Network Technology)

---

## 📄 License

This project is for educational purposes only.

---

⭐ Thank you for reviewing my project.
