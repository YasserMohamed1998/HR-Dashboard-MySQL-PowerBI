create database projects;

use projects;

SELECT * FROM hr;
alter table hr 
change column ï»¿id emp_id varchar(20) null;

describe hr;

SELECT birthdate FROM hr;

set sql_safe_updates =0;

update hr
set birthdate = case
  when birthdate like '%/%' then date_format( str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d' )
  when birthdate like '%-%' then date_format( str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d' )
  else  null
end;



ALTER TABLE HR
modify column  birthdate date;

update hr
set hire_date = case
  when hire_date like '%/%' then date_format( str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d' )
  when hire_date like '%-%' then date_format( str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d' )
  else  null
end;

alter table hr
modify column hire_date DATE;

select termdate from hr;
update hr
set termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
where true;

set sql_mode = 'ALLOW_INVALID_DATES';

alter table hr
modify column termdate DATE;

select termdate from hr;

alter table hr
add column age int;

update hr
set age = timestampdiff(year,birthdate,curdate());

select birthdate,age from hr;


SELECT * FROM hr;






