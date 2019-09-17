SET SERVEROUTPUT ON;
--CREATE OR REPLACE PACKAGE mypackage IS
--
--TYPE t_stats IS RECORD 
--(
--        department_name departments.department_name%TYPE,
--        count_employees NUMBER,
--        masse_salariale employees.salary%TYPE;
--)
--
--v_arr IS TABLE OF
--    t_stats INDEX PLS_INTEGER;
    
CREATE OR REPLACE PROCEDURE majuscule IS
    CURSOR v_emp_cursor IS
    SELECT * 
    FROM employees;
BEGIN
    FOR emp IN v_emp_cursor LOOP
        UPDATE employees
        SET first_name = UPPER(first_name),
        last_name = UPPER(last_name)
        WHERE employee_id = emp.employee_id;
    END LOOP;
END;

--CREATE OR REPLACE FUNCTION stats RETURN stats IS
--    CURSOR v_dept_cursor IS
--    SELECT department_name, COUNT(1), SUM(salary)
--    FROM departments dept, employees emp
--    WHERE emp.department_id = dept.deparment_id
--    GROUP BY emp.department_id;
--    
--BEGIN
--    FOR dept IN v_dept_cursor LOOP
--        v_stats(1) := dept;
--    END LOOP;
--END;
--
--END;

