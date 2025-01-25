-- 2025 01 25 -- 7:09 

-- Create user-defined function (T-SQL)
-- https://hasura.io/learn/database/microsoft-sql-server/create-function/


-- MS SQL user-defined functions are of 2 types: Scalar and Tabular-Valued
-- based on the type of result set each return.

-- A Scalar function accepts one or more parameters and returns a single value.

-- A Table-Valued function takes one input parameter
-- and returns the columns of the table

-- Requires CREATE FUNCTION permission in the database
-- and ALTER permission on the schema in which the functions are being created.
-- [ as referred in the Microsoft Docs ]


-- Syntax

-- 1. T-SQL Scalar function syntax

CREATE FUNCTION [ schema_name. ] <function_name> [
(@parameterName datatype)]
RETURNS return_data_type
BEGIN
    function_body --T-SQL statements
    RETURN scalar_expression
END;


-- 2. T-SQL Inline Table-Valued function syntax
CREATE FUNCTION [ schema_name. ] <function_name> [
(@parameterName datatype)]
RETURNS TABLE
AS
RETURN
(
    T-SQL statements
);
GO


-- 1. Scalar Functions
USE HASURA;
GO

CREATE FUNCTION dbo.getDeptId (@EmpId int)
RETURNS INT
AS
BEGIN
    DECLARE @DeptId int;
    SELECT @DeptId = e.DeptId
    FROM dbo.EMPLOYEE e
    WHERE e.EmpID=@EmpId;
    RETURN @DeptId;
END;
GO

-- Invoke the functions as:
SELECT dbo.getDeptId(3);

SELECT e.empName, dbo.getDeptId(e.EmpId) AS
DepartmentID FROM EMPLOYEE e;


-- 2. Table-Valued Functions
CREATE FUNCTION [dbo].[getEmpDetails] (@EmpId int)
RETURN TABLE
AS
RETURN
(
    SELECT e.EmpName, e.EmpID, d.DeptName
);
GO

-- Invoke the function as:
SELECT * FROM dbo.getEmpDetails(4);

-- result set:

-- EmpName -- EmpId -- DeptName
-- Musk -- 4 -- R&D

