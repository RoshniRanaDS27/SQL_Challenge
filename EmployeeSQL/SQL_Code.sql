-- DEPARTMENT table
CREATE TABLE Departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);

-- Dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(255),
);

--EMPLOYEE TABLE
CREATE TABLE EMPLOYEES (
    emp_no INT PRIMARY KEY,
    title_id VARCHAR(255),
    birth_date VARCHAR,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date VARCHAR
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(255),
    emp_no INT
);

CREATE TABLE SALARIES (
    emp_no INT PRIMARY KEY,
    salary INT
);

CREATE TABLE TITLES (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255)
);

ALTER TABLE EMPLOYEES
ALTER COLUMN birth_date TYPE DATE
USING TO_DATE(birth_date,'MM/DD/YYYY');

-- PRIMARY KEYS
ALTER TABLE dept_manager
ADD CONSTRAINT PK_dept_manager PRIMARY KEY (dept_no, emp_no);

-- FOREIGN KEY RELATIONSHIPS
ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEES_title_id FOREIGN KEY (title_id) REFERENCES TITLES(title_id);

ALTER TABLE dept_emp
ADD CONSTRAINT FK_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES EMPLOYEES(emp_no),
ADD CONSTRAINT FK_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT FK_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
ADD CONSTRAINT FK_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES EMPLOYEES(emp_no);

ALTER TABLE SALARIES
ADD CONSTRAINT FK_SALARIES_emp_no FOREIGN KEY (emp_no) REFERENCES EMPLOYEES(emp_no);

--List of the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM EMPLOYEES e
INNER JOIN SALARIES s ON e.emp_no = s.emp_no;


--List of the first name, last name, and hire date for the employees who were hired in 1986 
ALTER TABLE EMPLOYEES
ALTER COLUMN hire_date TYPE DATE
USING TO_DATE(hire_date,'MM/DD/YYYY');

SELECT first_name, last_name, hire_date
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN Departments d ON dm.dept_no = d.dept_no
INNER JOIN EMPLOYEES e ON dm.emp_no = e.emp_no;

--List of the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM dept_emp de
INNER JOIN Departments d ON de.dept_no = d.dept_no
INNER JOIN EMPLOYEES e ON de.emp_no = e.emp_no;

--List of first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM EMPLOYEES
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List of each employee in the Sales department, including their employee number, 
--last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM EMPLOYEES e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--List of each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM EMPLOYEES e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List of the frequency counts, in descending order, of all the employee last names 
SELECT last_name, COUNT(*) AS frequency
FROM EMPLOYEES
GROUP BY last_name
ORDER BY frequency DESC;

