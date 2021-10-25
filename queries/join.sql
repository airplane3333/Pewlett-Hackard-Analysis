-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
left join dept_emp
on retirement_info.emp_no = dept_emp.emp_no



-- Joining retirement_info and dept_emp tables using aliases
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

--retierment info using join
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

select count (first_name)
from current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
into ri_emp_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
order by de.dept_no;

select red.count, red.dept_no, d.dept_name
from ri_emp_dept as red
left join departments as d
on red.dept_no = d.dept_no

- sales list
SELECT  ce.emp_no,
		ce.first_name,
		ce.last_name,
		d.dept_name
--INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
Where d.dept_name IN ('Sales', 'Development');