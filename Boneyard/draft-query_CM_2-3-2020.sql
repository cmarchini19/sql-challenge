-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
FROM 
	employees
LEFT JOIN 
	salaries ON 
	employees.emp_no = salaries.emp_no
;

-- 2. List employees who were hired in 1986.
SELECT * FROM employees;

SELECT
	employees.hire_date, 
	employees.first_name, 
	employees.last_name
FROM 
	employees
WHERE 
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY 
	hire_date
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT 
	dept_manager.dept_no, 
	departments.dept_name, 
	dept_manager.emp_no, 
	employees.last_name, 
	employees.first_name, 
	salaries.from_date, 
	salaries.to_date
FROM 
	departments
LEFT JOIN 
	dept_manager 
	ON departments.dept_no = dept_manager.dept_no
LEFT JOIN 
	employees 
	ON dept_manager.emp_no = employees.emp_no
LEFT JOIN 
	salaries ON employees.emp_no = salaries.emp_no 
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM 
	employees
LEFT JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
;
	
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees;

SELECT 
	employees.first_name, 
	employees.last_name
FROM 
	employees
WHERE 
	first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM 
	employees
LEFT JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	dept_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM 
	employees
LEFT JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	dept_name = 'Sales' OR dept_name = 'Development'
;

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees;

SELECT 
	employees.last_name, 
	COUNT(employees.last_name)
FROM 
	employees
GROUP BY 
	employees.last_name
ORDER BY 
	COUNT(employees.last_name) DESC
;