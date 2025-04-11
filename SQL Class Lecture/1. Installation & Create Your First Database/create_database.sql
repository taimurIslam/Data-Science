-------------------------- Database --------------
-- Create Database
create database companydb;

-- Comment
comment on database companydb is 'This database stores employee information';

-- Rename Database Name
Alter database companydb rename to company_db;

-- Drop database 
DROP DATABASE IF EXISTS company_db;