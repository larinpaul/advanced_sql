--2025 03 02

-- https://careerfoundry.com/en/blog/data-analytics/data-transformation/

-- Data Transformation: A Total Beginner's Guide Eric Kleppen, Contributor to the CareerFoundry blog by Eric Kleppen, UPDATED ON MAY 11, 2023


-- ...

-- Using data transformation techniques, it's possible to bring the data out of their silos,
-- reformat them adn store them in acentral location called adata warehouse.
-- ...
-- Transforming JSON data into tabular data in SQL Server.

-- 1. What is data tranformation?
-- 2. How does data transformation work?
-- 3. How to perform a data transformation
-- 4. The benfits of data tranformation
-- 5. The challenges of data transformation
-- 6. Summary


-- At a high level, data transformation is the operations by which source data
-- are formatted or reshaped to fit the constraints of downstream systems or processes
-- Data transformation is often considered a data engineering or data govgernance task,
-- typically occurring in extract, transform, load or extract, load, transform (ETL/ELT)
-- pipelines designed to process raw data.

-- ...

-- The data transformation process

-- 1. Discovering
-- 2. Planning
-- 3. Performing
-- 4. Reviewing


-- 3. How to performs a data transformation: An example using SQL

-- Step 1: Create the source JSON data

create database dataTransformation


use dataTransformation
create table sourceJSONTable (
    [jsonID] [int] PRIMARY KEY CLUSTERED IDENTITY(1,1) NOT NULL,
    [jsonData] nvarchar(MAX) NOT NULL.
) ON [PRIMARY]

-- Then, populate sourceJSONTable using the following INSERT script:

insert into sourceJSONTable(jsonData)
select '{
                "country":"United States",
                "states":["California", "Minessota", "Washington"],
                "cities":[
                        {"CA":"San Diego"},
                        {"MN":"Minneapolis"},
                        {"WA":"Seattle"}
                  ]
        }'









