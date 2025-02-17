-- 1. List the following details of each employee: 
--    employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees 
--    who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '12/31/1985' AND hire_date < '01/01/1987';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, 
--    last name, first name.

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments as d
INNER JOIN dept_manager as m ON d.dept_no = m.dept_no
INNER JOIN employees as e ON m.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as q ON e.emp_no = q.emp_no
INNER JOIN departments as d ON q.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is 
--    "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as x ON e.emp_no = x.emp_no
INNER JOIN departments as d on x.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name, e.first_name;

-- 7. List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as x ON e.emp_no = x.emp_no
INNER JOIN departments as d on x.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'
ORDER BY e.last_name, e.first_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., 
--    how many employees share each last name.

SELECT last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;