SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into all_emp_retirement_titles
from employees as e 
inner join titles as t
on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no, to_date DESC



-- Use Dictinct with Orderby to remove duplicate rows
SELECT distinct on (emp_no) emp_no, first_name, last_name, title, to_date
into all_emp_retirement_titles_unique
from all_emp_retirement_titles
order by emp_no, to_date DESC;

select count(emp_no), title
into retiring_titles
from all_emp_retirement_titles_unique
group by title 
order by count DESC; 


select * from retiring_titles

--employees eligibility for mentorship
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
into mentorship_eligibilty
from employees as e
inner join dept_emp as de 
	on (de.emp_no = e.emp_no)
inner join titles as t 
	on (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
order by e.emp_no, to_date DESC