SET SERVEROUTPUT ON;

DECLARE
    v_email employees.email%TYPE;
    v_count_employees NUMBER;
    v_count_departments NUMBER;
    
BEGIN
    SELECT email
    INTO v_email
    FROM employees
    WHERE employee_id = 110;
    
    SELECT COUNT(DISTINCT employee_id)
    INTO v_count_employees
    FROM employees;
    
    SELECT COUNT(DISTINCT department_id)
    INTO v_count_departments
    FROM departments;
    
    DBMS_OUTPUT.PUT_LINE('L''email de l''employé dont l''id est 110 est: ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Le nombre d''employés est: ' || v_count_employees);
    DBMS_OUTPUT.PUT_LINE('Le nombre de départements est: ' || v_count_departments);
END;
/
    