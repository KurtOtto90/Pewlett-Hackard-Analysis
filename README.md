# Pewlett-Hackard-Analysis
## Overview
To provide analysis of projected employees who're retiring and those who can replace them.
## Results
  * 72,458 possible retirements
  * Only 1,549 possible mentors
  * 18,011 roles are entry level
  * 54,842 roles are senior engineer or staff
## Summary
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
HP will need to 72,458 positions due to retirements.
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Based on the current parameters there is not enough empolyees to act as mentors.

Query for additional mentors

select distinct on (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date, ti.title
into emp_mentor_additional
from employees as  em
left join dept_emp  as de
on em.emp_no = de.emp_no
left join titles as ti
on em.emp_no = ti.emp_no
where de.to_date = '9999-01-01' and de.from_date < '1991-01-01'
order by emp_no;

Query for mentors for by title

select count(emp_no), title
from emp_mentor_additional
group by title
order by count desc
