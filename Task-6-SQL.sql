CREATE DATABASE F;
USE F;
-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Insert departments
INSERT INTO departments VALUES
(1, 'HR', 'Chicago'),
(2, 'Finance', 'New York'),
(3, 'Engineering', 'Chicago'),
(4, 'Marketing', 'Los Angeles');

-- Insert employees
INSERT INTO employees VALUES
(101, 'Alice', 60000, 1),
(102, 'Bob', 75000, 1),
(103, 'Charlie', 50000, 2),
(104, 'David', 90000, 3),
(105, 'Eve', 85000, 3),
(106, 'Frank', 45000, 4);

-- Insert projects
INSERT INTO projects VALUES
(201, 'Project A', 102),
(202, 'Project B', 104),
(203, 'Project C', 105),
(204, 'Project D', 103);

-- Advanced Query
-- Get employees who:
-- - Are in departments located in 'Chicago'
-- - Earn more than their department's average salary
-- - Are assigned to at least one project

SELECT e.emp_id, e.name, e.salary, e.department_id
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Chicago'
)
AND e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
AND EXISTS (
    SELECT 1
    FROM projects p
    WHERE p.emp_id = e.emp_id
);


