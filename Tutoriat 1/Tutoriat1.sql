-- 1
SELECT EMPLOYEE_ID
FROM JOB_HISTORY
WHERE TO_CHAR(END_DATE, 'MONTH') LIKE '%EMBER%' OR TO_CHAR(END_DATE, 'MONTH') LIKE '_A%';


SELECT EMPLOYEE_ID
FROM JOB_HISTORY
WHERE INSTR(TO_CHAR(END_DATE, 'MONTH'), 'EMBER') > 0 OR TO_CHAR(END_DATE, 'MONTH') LIKE '_A%';

-- 2
SELECT replace(job_title, 'Manager', 'Sef') 
from jobs 
WHERE INSTR(job_title, 'Manager') > 0;

-- 3
select distinct nvl(commission_pct, 0) + 0.1
from employees;

-- 4
select last_name, first_name, employee_id, hire_date - to_date('01-JAN-' || to_char(hire_date, 'YYYY'), 'dd-mon-yyyy') as "Ziua numarul"
from employees;

-- 5
SELECT TRUNC(AVG((MIN_SALARY + MAX_SALARY)/2), 2) AS "Salariu mediu"
FROM JOBS;

-- 6
select last_name, first_name, employee_id, 
    CASE WHEN salary > 10000 THEN 'Sef'
        WHEN salary > 7500 THEN 'Experimentat'
        WHEN salary > 5000 THEN 'Intermediar'
        ELSE 'Incepator'
    END AS Statut
from employees
order by salary desc;

