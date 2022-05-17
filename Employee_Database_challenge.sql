--DELIVERABLE ONE

--Retirement Titles Query
select
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
from
	employees e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
order by
	e.emp_no;

--Unique Titles Query
select 
	distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title
INTO unique_titles
from
	employees e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = '9999-01-01'
order by
	e.emp_no;


--Retiring Titles Query
select 
	count(e.emp_no) as title_count,
	t.title
INTO retiring_titles
from
	employees e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = '9999-01-01'
group by
	t.title
order by
	title_count desc;



--DELIVERABLE TWO
select
	distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
from
	employees e
	join dept_emp de on e.emp_no = de.emp_no
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1965-01-01'
	and e.birth_date <= '1965-12-31'
	and de.to_date = '9999-01-01'
	and t.to_date = '9999-01-01'
order by
	e.emp_no