SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp_cursor(deptno NUMBER) IS
    SELECT * 
    FROM employees
    WHERE department_id = deptno;
    
    CURSOR c_dept_cursor IS
    SELECT *
    FROM departments;
BEGIN

    OPEN c_dept_cursor;
    
    FOR dept IN c_dept_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Département: ' || dept.department_name);
        OPEN c_emp_cursor(dept.department_id);
        
        FOR emp IN c_emp_cursor(dept.department_id) LOOP
            DBMS_OUTPUT.PUT_LINE('Département: ' || dept.department_name);
        END LOOP;
        
        CLOSE c_emp_cursor;

    END LOOP;
    
    CLOSE c_dept_cursor;

END;