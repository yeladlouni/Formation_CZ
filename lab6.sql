BEGIN
    -- Création de la table temporaire copy_emp
    CREATE TABLE copy_emp
    AS
    SELECT *
    FROM employees;
    
    UPDATE employees
    SET salary = 12000
    WHERE employee_id = 110;
    
    INSERT INTO employees 
    SELECT * FROM employees WHERE employee_id = 181;
    
    MERGE INTO copy_emp c
        USING employees e
        ON (e.employee_id = c.employee_id)
    WHEN MATCHED THEN
        c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.email = e.email
    WHEN NOT MATCHED THEN
        INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.department_id);
    
END;