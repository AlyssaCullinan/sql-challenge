-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.emp_title_id, e.birth_date, e.first_name, e.last_name, e.sex, e.hire_date, s.salary
from employees as e
inner join salaries as s on e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'; 

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select e.first_name, e.last_name, e.emp_no, d.dept_no, d.dept_name 
from employees e
inner join dept_manager dm on e.emp_no = dm.emp_no
inner join departments d on dm.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
where dept_no in (select dept_no from departments where dept_name = 'Sales');

--Count the number of employees in each department
select dept_no, count(emp_no) as emp_count
from dept_emp
group by dept_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_no in (select dept_no from departments where dept_name ='Sales' or dept_name = 'Development')
order by d.dept_name 

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as last_name_freq
from employees
group by last_name
order by last_name_freq desc;

