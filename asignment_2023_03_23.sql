-- (1)--
select distinct department_name
from departments
where department_id in (
    select department_id
    from empoloyees
    where salary <2000
);
-- (2)--
select country_name
from countries
where country_id not in (
    select distinct country_id
    from locations
    where location_id in (
        select distinct location_id
        from departments
        where department_id in(
            select department_id
            from employees
        )
    )
);
-- (3)--
select job_title
from jobs
where job_id in (
    select distinct e.job_id
    from employees e
    where e.department_id in (
        select distinct e1.department_id
        from employees e1
        where (select count(e2.employee_id)
        from employees e2
        where e1.department_id=e2.department_id)>=2

    )
);
-- (4) --
select distinct country_name
from countries
where country_id in (
    select distinct country_id
    from locations
    where city like 'a%'
);
-- (5) --
select distinct department_name
from departments
where location_id not in(
    select distinct location_id 
    from locations
    where city in (
        select distinct city 
        from locations;
    )
);
