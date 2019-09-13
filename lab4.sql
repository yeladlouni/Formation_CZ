SET SERVEROUTPUT ON;

BEGIN <<employee>>
DECLARE
    v_nom employees.last_name%TYPE;
BEGIN
    SELECT last_name 
    INTO v_nom
    FROM employees
    WHERE employee_id = 110;
    
    DBMS_OUTPUT.PUT_LINE('Le nom de l''employé est: ' || v_nom);
    
    BEGIN <<department>>
    DECLARE
        v_nom departments.department_name%TYPE;
    BEGIN
        /*SELECT department_name
        INTO v_nom
        FROM departments
        WHERE department_id = (SELECT department_id
                               FROM employees
                               WHERE employee_id = 110);*/
                               
        SELECT department_name
        INTO v_nom
        FROM departments natural join employees 
        WHERE employees.employee_id = 110;
        
        DBMS_OUTPUT.PUT_LINE('Le nom de l''employé est: ' || employee.v_nom || ', il est affecté
        au département ' || department.v_nom);
        
    END;
    END department;
END;
END employee;
