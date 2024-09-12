# SQL Functions, schemas, ERD (data modeling, data engineering, data analysis)
# Background
For this project, I designed the tables to store the data from the CSV files, imported the CSV files into a SQL database, and then answered key questions about the data. This process involved data modeling, data engineering, and data analysis.

# Instructions
This challenge was divided into three parts: 
- data modeling
- data engineering
- data analysis.

# Data Modeling
I began by inspecting the CSV files and sketched an Entity Relationship Diagram (ERD) to visualize the structure of the tables. To create the sketch, I used tools such as QuickDBD.

# Data Engineering
Using the information provided, I created a table schema for each of the six CSV files. The process included:

- Specifying data types, primary keys, foreign keys, and other constraints.
- Verifying the uniqueness of the primary keys or creating a composite key where necessary to uniquely identify a row.
- Ensuring that the tables were created in the correct order to handle foreign key dependencies.
Once the schema was finalized, I imported each CSV file into its corresponding SQL table.

# Data Analysis
After importing the data, I performed the following analyses:

- 1. Listed the employee number, last name, first name, sex, and salary of each employee.
- 2. Listed the first name, last name, and hire date for employees hired in 1986.
- 3. Identified the manager of each department along with their department number, department name, employee number, last name, and first name.
- 4. Listed the department number for each employee along with their employee number, last name, first name, and department name.
- 5. Listed the first name, last name, and sex of each employee whose first name was Hercules and whose last name started with the letter B.
- 6. Listed each employee in the Sales department, including their employee number, last name, and first name.
- 7. Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
- 8. Provided a frequency count, in descending order, of all employee last names, identifying how many employees shared each last name.
