-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hthqro
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] string  NOT NULL ,
    [dept_name] string  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] string  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_no] string  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [tittle_id] int  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [sex] string  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] int  NOT NULL ,
    [title_name] string  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [departments] WITH CHECK ADD CONSTRAINT [FK_departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [dept_manager] ([dept_no])

ALTER TABLE [departments] CHECK CONSTRAINT [FK_departments_dept_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [dept_manager] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [dept_emp] ([emp_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title_id] FOREIGN KEY([title_id])
REFERENCES [employees] ([tittle_id])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title_id]

COMMIT TRANSACTION QUICKDBD