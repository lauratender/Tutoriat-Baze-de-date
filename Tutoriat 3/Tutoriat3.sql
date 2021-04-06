-- Observatie asupra joinului normal si necesitatea left, right, full joinurilor
select *
from employees e join departments d on (e.department_id = d.department_id);

select *
from employees e,departments d 
where e.department_id = d.department_id;

-- left join

select *
from employees e left outer join departments d on (e.department_id = d.department_id);

select *
from employees e left outer join departments d on (d.department_id = e.department_id);

select *
from departments d left outer join employees e on (e.department_id = d.department_id);
-- conteaza ce tabel e stanga left joinului nu ordinea din conditia din clauza on

select *
from employees e,departments d 
where e.department_id = d.department_id(+);
-- plusul se pune unde va aparea null

-- right join
-- obs outer este optional
select *
from employees e right outer join departments d on (e.department_id = d.department_id);

select *
from employees e right join departments d on (e.department_id = d.department_id);

select *
from employees right outer join departments using (department_id);


select *
from employees e, departments d 
where e.department_id (+) = d.department_id;

-- full outer join
select *
from employees e full outer join departments d on (e.department_id = d.department_id);

--select *
--from employees e, departments d 
--where e.department_id (+) = d.department_id (+);
-- a predicate may reference only one outer-joined table

-- self join
select *
from employees e1 left join employees e2 on (e1.manager_id = e2.employee_id);

-- Exercitii
-- ex 1
select count(*)
from employees e;

select e.first_name, e.last_name, d.department_name
from employees e join departments d on (e.department_id = d.department_id);

select e.first_name, e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

-- ex 2
select e.first_name, e.last_name, nvl(d.department_name, 'Acest angajat nu face parte din niciun departament') as Department
from employees e left outer join departments d on (e.department_id = d.department_id);

select e.first_name, e.last_name, nvl(d.department_name, 'Acest angajat nu face parte din niciun departament') as Department
from employees e, departments d
where e.department_id = d.department_id (+);

-- Ex 3
-- Afiseaza numele si prenumele angajatii precizand care dintre acestia au avut un job in trecut
select distinct last_name, first_name, nvl2(end_date, 'yes', 'no') as "Had previous job"  
from job_history right join employees using (employee_id);

-- Ex 4
select first_name, last_name, department_name
from employees e full outer join departments d on (e.department_id = d.department_id);

-- Ex 5
-- Afiseaza numele si prenumele angajatilor impreuna cu numele si prenumele managerului lor, incluzand si angajatii care nu au un manager.
select e1.first_name, e1.last_name, e2.first_name, e2.last_name
from employees e1 left join employees e2 on (e1.manager_id = e2.employee_id);