-- 1.Write the quary to get the department and deoartment wise total(sum) salary, display it in ascending order according to salary
select departments.department_name,sum(employees.salary) as total_salarys
from departments,employees
where employees.department_id=departments.department_id
group by departments.department_name
order by total_salarys asc; 
-- 2.write the quary to get the department,total no.employee of each department,total(sum)salary with respect to department from employee table
select departments.department_name,count(employee_id) as NoOf_Employees,sum(employees.salary) as total_salarys
from employees,departments
where employees.department_id=departments.department_id
group by departments.department_name;
-- 3.get department wise maximum salary from employee table order by salary ascending order
select departments.department_name,max(employees.salary) as max_salary
from employees,departments
where employees.department_id=departments.department_id
group by departments.department_name
order by max_salary;
-- 4. Write a quary to get the departments where average salary is more then 60k
select D.department_name,avg(E.salary) as average_slary
from departments as D,employees as E
where D.department_id=E.department_id
group by D.department_name
having avg(E.salary)>60000;
-- 5.Write down the quary  to fetch  department name  asign to more  then one employee
select d.department_name,count(e.employee_id) as number_of_employees
from departments as d,employees as e
where e.department_id=d.department_id
group by d.department_name
having count(e.employee_id)>1;
-- 6.Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”
select d.department_name,
case
  when count(*)=1 
    then 'One candidate'
  else 'Multiple candidates' 
end as assignedTo
from employees as e,departments as d 
where d.department_id=e.department_id
group by d.department_name;
