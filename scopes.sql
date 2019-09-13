DECLARE
    v_nom employees.last_name%TYPE;
BEGIN <<employee>>
    SELECT last_name 
    INTO v_nom
    FROM employees
    WHERE employee_id = 110;
    
    DBMS_OUTPUT.PUT_LINE('Le nom de l''employé est: ' || v_nom);
    
    DECLARE
        v_nom departments.department_name%TYPE;
    BEGIN <<department>>
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
    END;
END;
