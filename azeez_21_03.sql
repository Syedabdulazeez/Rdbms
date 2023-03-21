--1. Select all records in table “Employees” whose lastnamestarts with ‘Sah’
select *
from employees
where last_name like 'sah%';
--2.Select 10 employees who were hired between 1stJ une,2021 to 15th February, 2022 .Start retrieving from the 4th recordinthetable
 select *
from employees
where hire_date BETWEEN  '2021-06-1' and '2022-12-15' 
limit 10 offset 3;
--3.Find distinct top5 salary values (only salarycolumn),using alias for column as “Top5salaries”
select distinct salary as Top5salaries
from employees
order by salary desc limit 5;
--4.find first_name,last_name and email of employees from the employee table  where salary lies between 25000 to 45000
select first_name,last_name,email 
from employees
where salary between 25000 and 45000;
--5. write a quary to find first_name,manager_id and salary whwre the department_id is 101 and sort the result in ascending order of salary
select first_name,manager_id,salary
from employees
where department_id =101
order by salary asc;
--6. find the first_name that start with the letter "A", and find all the last_name that have "th" in  the  2nd and 3rd positions
select *
from employees
where first_name like 'A%' and last_name like '_TH%';