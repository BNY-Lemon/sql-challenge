CREATE TABLE salaries (
	emp_no int primary key,
	salary int
);

CREATE TABLE titles (
	title_id varchar primary key,
	title varchar
);

CREATE TABLE employees (
	emp_no int primary key references salaries(emp_no),
	emp_title_id varchar references titles(title_id),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date
);

CREATE TABLE departments (
	dept_no varchar primary key,
	dept_name varchar
);

CREATE TABLE dept_manager (
	dept_no varchar references departments(dept_no),
	emp_no int references employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no int references employees(emp_no),
	dept_no varchar references departments(dept_no)
);