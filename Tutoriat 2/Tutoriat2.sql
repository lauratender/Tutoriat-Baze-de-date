-- Efectua?i produsul cartezian dintre mul?imea id-urilor angaja?ilor ?i mul?imea id-urilor departamentelor
SELECT e.employee_id, d.department_id
FROM EMPLOYEES e, DEPARTMENTS d;

SELECT e.employee_id, d.department_id
FROM EMPLOYEES e CROSS JOIN DEPARTMENTS d;

-- Afiseaza prenumele si numele angajatilor din departamentul "Purchasing" al caror job contine "clerk" in nume
SELECT first_name, last_name
FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID) JOIN JOBS USING (JOB_ID)
WHERE UPPER(JOB_TITLE) LIKE '%CLERK%' AND DEPARTMENT_NAME = 'Purchasing';

-- Afiseaza numele fiecarui depatament impreuna cu regiunea din care face parte.
SELECT department_name, region_name
FROM departments join locations using (location_id) join countries using (country_id) join regions using(region_id);

