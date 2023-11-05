DROP TABLE titles						
CREATE TABLE titles (title_id varchar, title varchar, PRIMARY KEY (title_id));

drop table employees
CREATE TABLE employees (emp_no INT, 
					   emp_title_id varchar, birth_date varchar (14), 
						first_name varchar, last_name varchar,
						sex varchar(4), hire_date varchar (14), 
						PRIMARY KEY (emp_no), foreign key (emp_title_id) references titles(title_id));
drop table salaries
CREATE TABLE salaries (emp_no INT, salary INT, PRIMARY KEY (emp_no),
					   FOREIGN KEY(emp_no) REFERENCES employees(emp_no));


drop table departments
CREATE TABLE departments(dept_no varchar, dept_name varchar, PRIMARY KEY (dept_no));

drop table dept_emp					   
CREATE TABLE dept_emp( id SERIAL PRIMARY KEY, emp_no INT, dept_no varchar, 
					  FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
			FOREIGN KEY (dept_no) REFERENCES departments);

drop table dept_manager
CREATE TABLE dept_manager(
 dept_no varchar, emp_no INT, PRIMARY KEY (emp_no), 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no));


