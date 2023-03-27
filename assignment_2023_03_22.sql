-- psql---
-- (1)--
select e.first_name||' '|| e.last_name as full_name,e.email,e.salary,d.department_name,l.postel_code,l.city
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;
-- (2)--
select d.department_name,l.state_province,l.street_address
from departments D
join locations l on d.location_id=l.location_id
where l.city in ('jummu Kashmir','jharkhand');
-- (3)--
select count(e.employee_id) as number_of_employees,j.job_title,avg(e.salary)
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title
having avg(e.salary)>1000000;
-- (4)--
select e.first_name,e.last_name
from employees e
full join departments d on d.department_id=e.department_id
order by e.last_name desc ;
-- (5) --
select e.first_name||' '||e.last_name as employee_name,m.first_name||' '||m.last_name as manger_name
from employees e
join employees m on e.employee_id =m.employee_id
where e.first_name=m.first_name and e.last_name=m.last_name;
-- (6) --
select d.department_name,l.city,count(e.employee_id) as employee_no_meeting_criteria
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
where e.salary>50000 and l.city in ('new yark','california')
group by d.department_name,l.city
having count(e.employee_id)>5; 
-- (7) --
select e.first_name|| ' '||e.last_name as employee_name,d.department_name,j.job_title
from employees e
join departments d on d.department_id=e.department_id
join jobs j on j.job_id=e.job_id
where j.job_title like '%manager%'
order by d.department_name;
-- (8) --
/* Added city column in dependents */
alter table dependents
add column city VARCHAR(255);

/* Added data into dependent column */
UPDATE
  dependents
SET
  city = 'New York'
WHERE
  dependent_id = 1;

UPDATE
  dependents
SET
  city = 'San Francisco'
WHERE
  dependent_id = 2;

UPDATE
  dependents
SET
  city = 'Boston'
WHERE
  dependent_id = 3;

UPDATE
  dependents
SET
  city = 'Washington DC'
WHERE
  dependent_id = 4;

UPDATE
  dependents
SET
  city = 'Bangalore'
WHERE
  dependent_id = 5;
/* quary*/
select e.first_name || ' ' || e.last_name as employee_name, dpt.department_name, l.city from employees e 
inner join dependents d on d.employee_id = e.employee_id 
inner join jobs j on e.job_id = j.job_id 
inner join (select m.employee_id,j.job_title as manager_job_title from employees m inner join jobs j on m.job_id = j.job_id) manager on manager.employee_id = e.employee_id
inner join departments dpt ON dpt.department_id = e.department_id 
inner join locations l ON l.location_id = dpt.location_id 
inner join (select j.job_title,avg(e.salary) as avg_salary from jobs j inner join employees e
on j.job_id = e.job_id group by j.job_title) job_avg on j.job_title = job_avg.job_title
where d.city <> l.city AND e.hire_date >= current_date - interval '3 years' and e.salary > job_avg.avg_salary and manager.manager_job_title like '%director%' order by dpt.department_name;

