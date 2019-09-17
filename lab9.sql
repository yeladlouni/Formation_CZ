SET SERVEROUTPUT ON;

DECLARE
    TYPE dept_table_type IS TABLE
    OF departments%ROWTYPE INDEX BY PLS_INTEGER;
    
    TYPE emp_table_type IS TABLE
    OF employees%ROWTYPE INDEX BY PLS_INTEGER;
    
    dept_table dept_table_type;
    emp_table emp_table_type;
BEGIN
    SELECT * INTO emp_table(1) FROM employees WHERE employee_id = 110;
    SELECT * INTO emp_table(2) FROM employees WHERE employee_id = 101;
    
    SELECT * INTO dept_table(1) FROM departments WHERE department_id = emp_table(1).department_id;
    SELECT * INTO dept_table(2) FROM departments WHERE department_id = emp_table(2).department_id;
    
    
    DBMS_OUTPUT.PUT_LINE(emp_table(1).first_name || ' ' ||
        emp_table(1).last_name || ' ' ||
        emp_table(1).salary || ' ' ||
        dept_table(1).department_name);
    
    
    DBMS_OUTPUT.PUT_LINE(emp_table(2).first_name || ' ' ||
        emp_table(2).last_name || ' ' ||
        emp_table(2).salary || ' ' ||
        dept_table(2).department_name);

END;