-- creating tables for PH-EmployeeDB
CREATE table departments ( dept_no varchar(4) not null,
						 dept_name varchar(40) not null,
						  primary Key (dept_no),
						  unique (dept_name));

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no));


CREATE TABLE dept_emp (emp_no INT not null,
					   dept_no varchar not null,
					   from_date date not null,
					   to_date date not null,
					   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
					   FOReign key (emp_no) REferences employees (emp_no),
					  PRIMARY key (emp_no, dept_no));

CREATE TABLE titles (emp_no INT not null,
					 title varchar not null,
					 from_date date not null,
					 to_date date not null,
					 FOREIGN KEY (emp_no) references employees (emp_no),
					  PRIMARY key (emp_no));
					  
				


CREATE TABLE dept_manager (dept_no VARCHAR(4) NOT NULL,
						   emp_no INT NOT NULL,
						   from_date DATE NOT NULL,
						   to_date DATE NOT NULL,
						   FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
						   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
						   PRIMARY KEY (emp_no, dept_no));