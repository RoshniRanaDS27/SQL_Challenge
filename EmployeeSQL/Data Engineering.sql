-- DEPARTMENT table
CREATE TABLE Departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);

--imported CSV file to 'Departments' table from data folder

-- Dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(255),
);

--imported CSV file to 'Dept_emp' table from data folder

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

--imported CSV file to 'Employees' table from data folder

--Dept_manager table 
CREATE TABLE dept_manager (
    dept_no VARCHAR(255),
    emp_no INT
);

-- Salaries TABLE
CREATE TABLE SALARIES (
    emp_no INT PRIMARY KEY,
    salary INT
);

--Titles TABLE
CREATE TABLE TITLES (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255)
);

--Employees TABLE
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
