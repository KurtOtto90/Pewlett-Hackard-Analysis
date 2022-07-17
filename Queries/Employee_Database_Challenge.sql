drop table if exists retiring_emp_challenge;
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retiring_emp_challenge
FROM employees as e
left join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') --and to_date = '9999-01-01'
ORDER BY e.emp_no;
select * from retiring_emp_challenge


drop table if exists retiring_emp_challenge_disctinct;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retiring_emp_challenge_disctinct
FROM employees as e
left join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and to_date = '9999-01-01'
ORDER BY e.emp_no;
select * from retiring_emp_challenge_disctinct;

Select count(*), title 
from retiring_emp_challenge_disctinct
group by title
order by count DESC;

select distinct on (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date, ti.title
into emp_mentor
from employees as  em
left join dept_emp  as de
on em.emp_no = de.emp_no
left join titles as ti
on em.emp_no = ti.emp_no
where (birth_date between '1965-01-01' and '1965-12-31') and de.to_date = '9999-01-01'
order by emp_no;
select * from emp_mentor;