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