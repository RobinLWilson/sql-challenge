--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no as "Employee #", employees.last_name as "Last Name", employees.first_name as "First Name", employees.sex as "Sex", salaries.salary as "Salary"
FROM employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date "1986 Hire Date"
FROM employees
WHERE hire_date LIKE '______1986';
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.emp_no as "Employee # of Department Manager", departments.dept_no as "Department #", departments.dept_name as "Department Name", employees.last_name as "Manager Last Name", employees.first_name as "Manager First Name"
FROM ((dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no);
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no as "Department #", employees.emp_no as "Employee #", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department Name"
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no);
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name as "First Name", last_name as "Last Name", sex as "Sex"
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'; 
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no as "Sales Dept Employee #", first_name as "First Name", last_name as "Last Name"
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp
  WHERE dept_no IN
	(
		select dept_no 
		from departments
		WHERE dept_name = 'Sales'
	)
);
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no as "Employee #", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department Name" 
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name as "Last Name", count(last_name) as "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
