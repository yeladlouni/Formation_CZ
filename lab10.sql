SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp_cursor(deptno NUMBER) IS
    SELECT * 
    FROM employees
    WHERE department_id = deptno;
    
    CURSOR c_dept_cursor IS
    SELECT *
    FROM departments;
    
    dept c_dept_cursor%ROWTYPE;
    emp c_emp_cursor%ROWTYPE;
BEGIN
    
    FOR dept IN c_dept_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Département: ' || dept.department_name);
        
        FOR emp IN c_emp_cursor(dept.department_id) LOOP
            DBMS_OUTPUT.PUT_LINE('    Employé: ' || emp.first_name || ' ' || emp.last_name ||
            ' ' || emp.salary);
        END LOOP;
    END LOOP;
END;