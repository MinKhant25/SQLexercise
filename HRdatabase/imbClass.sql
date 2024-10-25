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

# Retrieve all employees whose address is in Elgin,IL.
SELECT *
FROM employees 
WHERE ADDRESS LIKE '%Elgin,IL';

# Retrieve all employees who were born during the 1970’s.
SELECT *
FROM employees 
WHERE B_DATE >= '1970-01-01' AND B_DATE <= '1979-12-31';

# Checking data type
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_name = 'employees' AND COLUMN_NAME = 'B_DATE';
  
# Retrieve all employees in department 5 whose salary is between 60000 and 70000
SELECT *
FROM employees 
WHERE DEP_ID = 5 AND (SALARY BETWEEN 60000 AND 70000);
  
# Retrieve a list of employees ordered by department ID
SELECT *
FROM employees
ORDER BY DEP_ID;

# Retrieve a list of employees ordered in descending order by department ID 
# and within each department ordered alphabetically in descending order by last name.
SELECT *
FROM employees
ORDER BY DEP_ID DESC, L_NAME DESC;

# Retrieve a list of employees ordered by department name, 
# and within each department ordered alphabetically in descending order by last name.
SELECT employees.F_NAME, employees.L_NAME, departments.DEP_NAME
FROM employees, departments
ORDER BY departments.DEP_NAME DESC, employees.L_NAME DESC;

# For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(F_NAME) AS emmployee_count
FROM employees
GROUP BY DEP_ID
ORDER BY DEP_ID;

# For each department retrieve the number of employees in the department, 
# and the average employee salary in the department.
SELECT DEP_ID, COUNT(F_NAME) AS NUMM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM employees
GROUP BY DEP_ID
ORDER BY DEP_ID;

# order the result set by Average Salary.
SELECT DEP_ID, COUNT(F_NAME) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM employees
GROUP BY DEP_ID
ORDER BY AVG_SALARY;

# limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(F_NAME) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM employees
GROUP BY DEP_ID
HAVING NUM_EMPLOYEES < 4
ORDER BY AVG_SALARY;