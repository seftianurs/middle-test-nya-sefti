CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

INSERT INTO employee_table (employee, salary) VALUES
('Alice', 11),
('Benn', 43),
('Charles', 33),
('Dorothy', 55),
('Emma', 22),
('Franklin', 33);

SELECT * FROM employee_table;

CREATE PROCEDURE salary_rank
	AS
	BEGIN
		SELECT	
			employee,
			salary,
    RANK () OVER (
      		ORDER BY salary DESC) AS salary_rank
        FROM employee_table;
        END;

EXEC salary_rank;

	SELECT *
FROM (
    SELECT
        employee,
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM
        employee_table
) AS ranked_employees
WHERE rank = 3;

