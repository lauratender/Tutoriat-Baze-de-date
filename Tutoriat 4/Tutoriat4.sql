-- 1
SELECT employee_id, last_name, first_name, salary
FROM EMPLOYEES 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- 2
SELECT employee_id, last_name, first_name, salary
FROM EMPLOYEES e1
WHERE SALARY > (SELECT AVG(SALARY) 
                FROM EMPLOYEES e2
                WHERE e1.department_id = e2.department_id);
                
-- 3
SELECT employee_id, last_name, first_name, department_name
FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID IN (SELECT d.department_id
                        FROM DEPARTMENTS D JOIN EMPLOYEES E ON (D.MANAGER_ID = E.EMPLOYEE_ID)
                        WHERE e.last_name = 'Russell' OR e.last_name = 'Hunold');


