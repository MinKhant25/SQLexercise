SELECT * 
FROM departments;

SELECT * 
FROM locations;

SELECT * 
FROM employees;

SELECT * 
FROM jobs;

SELECT *
FROM job_history;

# Select the names and job start dates of all employees who work for the department number 5.
SELECT e.F_NAME, e.L_NAME, j.START_DATE, e.DEP_ID
FROM employees e INNER JOIN job_history j
ON e.DEP_ID = j.DEPT_ID
WHERE e.DEP_ID = 5;

# Select the names, job start dates, and job titles of all employees who work for the department number 5.
SELECT e.F_NAME, e.L_NAME, j.START_DATE, jobs.JOB_TITLE, e.DEP_ID
FROM employees e INNER JOIN job_history j
ON e.DEP_ID = j.DEPT_ID
INNER JOIN jobs ON j.JOBS_ID = jobs.JOB_IDENT
WHERE e.DEP_ID = 5;

# Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and  
# select employee id, last name, department id and department name for all employees.
SELECT e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP;

# Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
SELECT e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP
WHERE e.B_DATE < '1980-01-01';

# Re-write the previous query but have the result set include all the employees 
# but department names for only the employees who were born before 1980.
SELECT e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP 
AND YEAR(e.B_DATE) < 1980;

# Perform a Full Join on the EMPLOYEES and DEPARTMENT tables 
# and select the First name, Last name and Department name of all employees.
# mySQL doesn't support outer join , so union is used instead.
SELECT e.F_NAME, e.L_NAME, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP
UNION
SELECT e.F_NAME, e.L_NAME, d.DEP_NAME
FROM employees e RIGHT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP;

# Re-write the previous query but have the result set include all employee names
# but department id and department names only for male employees.
SELECT e.F_NAME, e.L_NAME, d.DEPT_ID_DEP, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP
AND e.SEX = 'M'
UNION
SELECT e.F_NAME, e.L_NAME, d.DEPT_ID_DEP, d.DEP_NAME
FROM employees e RIGHT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP
AND e.SEX = 'M';

# OR
SELECT e.F_NAME, e.L_NAME, d.DEPT_ID_DEP, d.DEP_NAME
FROM employees e LEFT JOIN departments d
ON e.DEP_ID = d.DEPT_ID_DEP
AND e.SEX = 'M';