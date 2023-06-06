-- Listing Each Employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no)

--Listing Employees Hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Listing Managers
SELECT t.title, dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager dm
ON (e.emp_no = dm.emp_no)
INNER JOIN departments d
ON (dm.dept_no = d.dept_no)
INNER JOIN titles t
ON (e.emp_title_id = t.title_id);

--Listing Department Numbers of Employees
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN departments d
ON (de.dept_no = d.dept_no);

--Listing Employees B_, Hercules
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Listing Employees in Sales
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'

--Listing Employees in Sales and Development
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'

--Listing Most Common Last Names in Descending Order
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;