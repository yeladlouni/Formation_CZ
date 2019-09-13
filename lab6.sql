DECLARE 
    v_name VARCHAR2(20);
BEGIN
    -- Création de la table temporaire copy_emp
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE hr.copy_emp AS SELECT * FROM employees';
        COMMIT;
    END;
    
    BEGIN
        UPDATE hr.employees
        SET salary = 12000
        WHERE employee_id = 110;
    END;
    
    INSERT INTO hr.employees 
    VALUES(EMPLOYEES_SEQ.nextval, 'dummy', 'dummy', 'a@a.com', '002126000000',
    '01-01-2019', 'IT_PROG', 10000, NULL, NULL, 10);
    
    MERGE INTO hr.copy_emp c
        USING hr.employees e
        ON (e.employee_id = c.employee_id)
    WHEN MATCHED THEN
        UPDATE SET
            c.first_name = e.first_name,
            c.last_name = e.last_name,
            c.email = e.email
    WHEN NOT MATCHED THEN
        INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email,
        e.phone_number, e.hire_date, e.job_id, e.salary,
        e.commission_pct, e.manager_id, e.department_id);
        
            
END;