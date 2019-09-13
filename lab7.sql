SET SERVEROUTPUT ON;

DECLARE
    v_fName employees.first_name%TYPE;
BEGIN
    SELECT first_name
    INTO v_fName
    FROM employees
    WHERE employee_id = 110;
    
    IF INSTR(v_fName, 'o') > 0 
    THEN
        DBMS_OUTPUT.PUT_LINE('o');
    ELSIF INSTR(v_fName, 'A') > 0
    THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF INSTR(v_fName, 'I') > 0
    THEN
        DBMS_OUTPUT.PUT_LINE('I');
    END IF;
    
END;
