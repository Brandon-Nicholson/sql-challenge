select * from departments
select * from dept_emp
select* from employees
select * from salaries
select * from titles

--List the employee number, last name, first name, sex, and salary of each employee.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
join salaries as sal
on emp.emp_no = sal.emp_no

select * from employees
select * from salaries

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select depm.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from dept_manager as depm
join departments as dept
on depm.dept_no = dept.dept_no
join employees as emp
on depm.emp_no = emp.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
from employees as emp
join dept_emp
on dept_emp.emp_no = emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
select emp.emp_no, emp.last_name, emp.first_name
from employees as emp
join dept_emp
on dept_emp.emp_no = emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
from employees as emp
join dept_emp
on dept_emp.emp_no = emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as "last_name_counts"
from employees
group by last_name
order by "last_name_counts" desc
