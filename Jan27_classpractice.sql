CREATE TABLE DEPARTMENT(
	DepartmentName Char(35) NOT NULL PRIMARY KEY,
	BudgetCode Char(30) NOT NULL,
	OfficeNumber Char(15) NOT NULL,
	Phone Char(12)
);
CREATE  TABLE EMPLOYEE(
	EmployeeNumber Int NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	FirstName Char(25) NOT NULL,
	LastName Char(25) NOT NULL,
	Department Char(35) NOT NULL DEFAULT 'Human Resources',
	Phone Char(12) NULL,
	Email VarChar(100) NOT NULL UNIQUE,
	CONSTRAINT EMP_DEPART_FK FOREIGN KEY(Department)
		REFERENCES DEPARTMENT(DepartmentName)
			ON UPDATE CASCADE
);
CREATE TABLE PROJECT(
	ProjectID Int NOT NULL IDENTITY (1000, 100) PRIMARY KEY,
	ProjectName Char(50) NOT NULL,
	Department Char(35) NOT NULL,
	MaxHours Numeric(8,2) NOT NULL DEFAULT 100,
	StartDate DateTime NULL,
	EndDate DateTime NULL,
	CONSTRAINT PROJECT_DEPART_FK FOREIGN KEY(Department)
		REFERENCES DEPARTMENT(DepartmentName)
			ON UPDATE CASCADE
);
CREATE TABLE ASSIGNMENT(
	ProjectID Int NOT NULL,
	EmployeeNumber Int NOT NULL,
	HoursWorked Numeric(6,2) NULL,

	CONSTRAINT ASSIGNMENT_PK PRIMARY KEY (ProjectID, EmployeeNumber),

	CONSTRAINT ASSIGNMENT_PROJCT_FK FOREIGN KEY (ProjectID)
		REFERENCES PROJECT (ProjectID)
			ON UPDATE NO ACTION
			ON DELETE CASCADE,

	CONSTRAINT ASSIGNMENT_EMPLOYEE_FK FOREIGN KEY (EmployeeNumber)
		REFERENCES EMPLOYEE (EmployeeNumber)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
);

