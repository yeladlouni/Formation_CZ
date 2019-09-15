DECLARE
    v_counter NUMBER := 1;
    max_id employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id)
    INTO max_id
    FROM employees;

    LOOP
        INSERT INTO employees
        SELECT max_id+v_counter, 
        first_name,
        last_name,
        email||v_counter,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
        FROM employees
        WHERE employee_id = 110;
        EXIT WHEN v_counter > 10;
    END LOOP;
END;